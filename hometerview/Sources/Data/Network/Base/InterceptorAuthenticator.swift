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
            request.setValue("\(memterToken.accessToken)", forHTTPHeaderField: "Authorization-Access-Token")
            request.setValue("\(memterToken.refreshToken)", forHTTPHeaderField: "Authorization-Refresh-Token")
            Log.info("adapted => \(request)")
        }

        completion(.success(request))
    }

    //MARK: Retry 정책 구현 예정
}
