//
//  HomeCitiesRequest.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation

import Alamofire

struct HomeCitiesRequest: Requestable {
    typealias Response = HomeCitiesDTO?
    #warning("Home Cities path 확정 필요")
    var path: String {
        return "place/cities"
    }

    var baseURL: String {
        Environment.baseURL
    }

    var method: Alamofire.HTTPMethod {
        return .get
    }

    var parameters: Parameters
}
