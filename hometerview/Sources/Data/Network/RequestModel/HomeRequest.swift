//
//  HomeRequest.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/16.
//

import Foundation

import Alamofire
struct HomeRequest: Encodable {

}

enum HomeTarget: Requestable {
    case home(HomeRequest)
}

extension HomeTarget {
    var path: String {
        return "/"
    }

    var baseURL: String {
        return BaseNetwork.baseURL
    }

    var method: HTTPMethod {
        return .get
    }

    var requestParameters: RequestParams {
        switch self {
            case .home(let request): return .query(request)
        }
    }

    var header: [HTTPFields : String] {
        return [
            HTTPFields.contentType: HTTPHeaderType.contentType.header,
            HTTPFields.authorization: "Bearer \(HTTPHeaderType.authorization.header)"
        ]
    }
}
