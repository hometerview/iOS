//
//  MyReviewRequest.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

import Alamofire

struct MyReviewRequest: Requestable {
    typealias Response = MyReviewWrapperDTO

    var path: String {
        return "/review/my"
    }

    var baseURL: String {
        Environment.baseURL
    }

    var method: Alamofire.HTTPMethod {
        return .get
    }

    var parameters: Parameters
}
