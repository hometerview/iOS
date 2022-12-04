//
//  HomeReviewRequest.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation

import Alamofire

struct HomeReviewRequest: Requestable {
    typealias Response = EmptyEntity?

    var path: String {
        return "review"
    }

    var baseURL: String {
        Environment.baseURL
    }

    var method: Alamofire.HTTPMethod {
        return .get
    }

    var parameters: Parameters
}
