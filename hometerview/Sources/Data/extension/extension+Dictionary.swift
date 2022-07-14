//
//  extension+Dictionary.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/14.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    func toQueryItems() -> [URLQueryItem] {
        return self.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }

    func toData() throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: [])
    }
}
