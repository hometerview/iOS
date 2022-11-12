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
    private let session = AF
    private let decoder = JSONDecoder()
    private let interceptorAuthenticator: RequestInterceptor

    init(interceptorAuthenticator: RequestInterceptor = InterceptorAuthenticator()) {
        self.interceptorAuthenticator = interceptorAuthenticator
    }

    func request<API: Requestable>(api: API) -> AnyPublisher<API.Response, Error> {
        session.request(api, interceptor: interceptorAuthenticator)
            .validate(statusCode: 200..<500)
            .publishDecodable(type: API.Response.self)
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
}
