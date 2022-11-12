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
