//
//  extension+Encodable.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/14.
//

import Foundation

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let jsonData = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return [:]
        }
        return jsonData
    }
}
