//
//  RequestParams.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/14.
//

import Foundation

public enum RequestParams {
    case query(_ parameter: Encodable?)
    case body(_ parameter: Encodable?)
}
