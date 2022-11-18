//
//  Environment.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation

struct Environment {
    public static var baseURL: String {
        guard let baseURLString = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            return "http://" + "3.36.37.15:8080/api/v1/"
        }

        return baseURLString
    }
}
