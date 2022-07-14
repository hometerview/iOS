//
//  HTTPFields.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/14.
//

import Foundation

public enum HTTPField: String, CustomStringConvertible {
    case contentType = "Content-Type"
    case accept = "Accept"
    case authorization = "Authorization"

    public var description: String {
        switch self {
            case .contentType: return self.rawValue
            case .accept: return self.rawValue
            case .authorization: return self.rawValue
        }
    }
}
