//
//  InterceptorAuthenticator.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation

import Alamofire

public class InterceptorAuthenticator: RequestInterceptor {
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest

        if let memterToken = User.shared.memberToken {
            request.setValue("\(memterToken.accessToken)", forHTTPHeaderField: HTTPHeaderType.authorizationAccessToken.header)
            request.setValue("\(memterToken.refreshToken)", forHTTPHeaderField: HTTPHeaderType.authorizationRefreshToken.header)
            Log.info("adapted => \(request)")
        }

        completion(.success(request))
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse,
              response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }

        #warning("토큰 언제 다시 주는지 확인 필요")
        if let newAccessToken = response.allHeaderFields[HTTPHeaderType.authorizationAccessToken.header] as? String,
           let newRefreshToken = response.allHeaderFields[HTTPHeaderType.authorizationRefreshToken.header] as? String {

            let newMemberToken = MemberToken(accessToken: newAccessToken, refreshToken: newRefreshToken)
            User.shared.setToken(memberToken: newMemberToken)

            Log.info("retry => 새 토큰 갱신")

            completion(.retryWithDelay(0.5))
        } else {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .tokenExpired, object: nil)
            }

            Log.info("401, 토큰 만료")

            let tokenExpiredError = ResponseError(responseCode: nil, message: NetworkErrorType.tokenExpired.description)
            completion(.doNotRetryWithError(tokenExpiredError))
        }
    }
}
