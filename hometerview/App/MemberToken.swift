//
//  MemberToken.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation

struct MemberToken {
    let accessToken: String
    let refreshToken: String
}

extension MemberToken: Codable, Equatable { }
