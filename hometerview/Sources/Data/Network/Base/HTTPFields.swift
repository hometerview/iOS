//
//  HTTPFields.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/14.
//

import Foundation

public enum HTTPFields: String, CustomStringConvertible {
    case contentType = "Content-Type"
    case accept = "Accept"
    case authorization = "Authorization"
    case authorizationRefreshToken = "Authorization-Access-Token"
    case authorizationAccessToken = "Authorization-Refresh-Token"

    public var description: String {
        return self.rawValue
    }
}
