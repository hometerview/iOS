//
//  BaseNetwork.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/10.
//

import Foundation

struct BaseNetwork {
    public static var baseURL: String {
        guard let baseURLString = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            return "https://" + "13.125.75.159:8080/api/v1/"
        }

        return baseURLString
    }
}
