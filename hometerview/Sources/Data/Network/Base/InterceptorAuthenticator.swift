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
            request.setValue("\(memterToken.accessToken)", forHTTPHeaderField: HTTPFields.authorizationAccessToken.description)
            request.setValue("\(memterToken.refreshToken)", forHTTPHeaderField: HTTPFields.authorizationRefreshToken.description)
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
        if let newAccessToken = response.allHeaderFields[HTTPFields.authorizationAccessToken.description] as? String,
           let newRefreshToken = response.allHeaderFields[HTTPFields.authorizationRefreshToken.description] as? String {

            let newMemberToken = MemberToken(accessToken: newAccessToken, refreshToken: newRefreshToken)
            User.shared.setToken(newMemberToken)

            Log.info("retry => 새 토큰 갱신")

            completion(.retryWithDelay(0.5))
        } else {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .tokenExpired, object: nil)
            }

            Log.info("401, 토큰 만료, 로그인 화면으로 돌아가야 합니다.")

            let tokenExpiredError = ResponseError(responseCode: nil, message: NetworkErrorType.tokenExpired.description)
            completion(.doNotRetryWithError(tokenExpiredError))
        }
    }
}
