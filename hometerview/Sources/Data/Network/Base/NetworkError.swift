//
//  NetworkError.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

struct ResponseError: Error {
    let responseCode: String? // "CM03",
    let message: String // "비인증된 요청입니다.",
}

enum NetworkErrorType {
    case tokenExpired
}

extension NetworkErrorType: CustomStringConvertible {
    var description: String {
        switch self {
            case .tokenExpired:
                return "토큰이 만료됐습니다"
        }
    }
}
