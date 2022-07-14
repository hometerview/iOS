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
    case authorization

    var header: String {
        switch self {
            case .contentType:
                return "application/json"
            case .multiPartFormData:
                return "multipart/form-data"
            case .authorization:
                // 멤버 토큰
                return ""
        }
    }
}
