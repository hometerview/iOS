//
//  MyReviewRequest.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

import Alamofire

struct MyReviewRequest: Encodable {
    let offset: Int?
    let pageNumber: Int?
    let pageSize: Int?
}

enum MyReviewTarget: Requestable {
    case myReview(MyReviewRequest)
}

extension MyReviewTarget {
    var path: String {
        return "/review/my"
    }

    var baseURL: String {
        return BaseNetwork.baseURL
    }

    var method: HTTPMethod {
        return .get
    }

    var requestParameters: RequestParams {
        switch self {
            case .myReview(let request): return .query(request)
        }
    }

    var header: [HTTPFields : String] {
        return [
            HTTPFields.contentType: HTTPHeaderType.contentType.header,
            HTTPFields.authorization: "Bearer \(HTTPHeaderType.authorization.header)"
        ]
    }
}
