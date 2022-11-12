//
//  KakaoLoginRequest.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation

import Alamofire

struct KakaoLoginRequest: Requestable {
    typealias Response = EmptyEntity

    var path: String {
        return "auth/login/kakao"
    }

    var baseURL: String {
        Environment.baseURL
    }

    var method: Alamofire.HTTPMethod {
        return .post
    }

    var parameters: Parameters
}
