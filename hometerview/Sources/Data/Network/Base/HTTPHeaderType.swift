//
//  HTTPHeaderType.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/14.
//

import Foundation

public enum HTTPHeaderType {
    case contentType
    case multiPartFormData
    case authorizationRefreshToken
    case authorizationAccessToken

    var header: String {
        switch self {
            case .contentType:
                return "application/json"
            case .multiPartFormData:
                return "multipart/form-data"
            case .authorizationAccessToken:
                return "Authorization-Access-Token"
            case .authorizationRefreshToken:
                return "Authorization-Refresh-Token"
        }
    }
}
