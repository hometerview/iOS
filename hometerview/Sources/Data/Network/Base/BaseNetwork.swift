//
//  BaseNetwork.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/10.
//

import Foundation

import Combine
import Alamofire

protocol BaseNetwork {
    func request<API: Requestable>(api: API) -> AnyPublisher<API.Response, Error>
}

struct BaseNetworkImpl: BaseNetwork {
    private let decoder = JSONDecoder()
    private let session: Session
    private let interceptorAuthenticator: RequestInterceptor

    init(interceptorAuthenticator: RequestInterceptor = InterceptorAuthenticator()) {
        self.interceptorAuthenticator = interceptorAuthenticator

        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 10
        configuration.waitsForConnectivity = true
        self.session = Session(configuration: configuration)
    }

    func request<API: Requestable>(api: API) -> AnyPublisher<API.Response, Error> {
        session.request(api, interceptor: interceptorAuthenticator)
            .validate(statusCode: 200..<500)
            .publishDecodable(type: API.Response.self)
            .handleEvents(receiveOutput: { saveNewToken(api: api, $0) })
            .tryMap {
                guard let responseData = $0.data,
                      let json = try JSONSerialization.jsonObject(with: responseData) as? [String: Any],
                      let responseCode = json["responseCode"] as? String,
                      let message = json["message"] as? String else {
                    Log.error("디코딩 에러 발생")
                    throw ResponseError(responseCode: nil, message: "알 수 없는 에러가 발생했습니다.")
                }

                guard let value = $0.value else {
                    Log.error("value 에러 발생")
                    throw ResponseError(responseCode: nil, message: "알 수 없는 에러가 발생했습니다.")
                }

                guard responseCode == "CM00" else {
                    throw ResponseError(responseCode: responseCode, message: message)
                }

                return value
            }
            .eraseToAnyPublisher()
    }

    private func saveNewToken<API: Requestable>(api: API, _ event: DataResponsePublisher<API.Response>.Output) {
        guard let accessToken = event.response?.allHeaderFields[HTTPHeaderType.authorizationAccessToken.header] as? String,
              let refreshToken = event.response?.allHeaderFields[HTTPHeaderType.authorizationRefreshToken.header] as? String,
              User.shared.memberToken?.accessToken != accessToken,
              User.shared.memberToken?.refreshToken != refreshToken else {
            return
        }

        let memberToken = MemberToken(accessToken: accessToken, refreshToken: refreshToken)
        User.shared.setToken(memberToken: memberToken)
    }
}
