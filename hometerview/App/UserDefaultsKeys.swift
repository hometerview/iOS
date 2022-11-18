//
//  UserDefaultsKeys.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation

enum UserDefaultsKeys {
    case token
}

extension UserDefaultsKeys: CustomStringConvertible {
    var description: String {
        switch self {
            case .token: return "token"
        }
    }
}
