//
//  LivingFloorModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import Foundation

enum LivingFloorModel: String, CustomStringConvertible ,CaseIterable {
    case high = "고층"
    case middle = "중층"
    case low = "저층"
    case secret = "비공개"

    var description: String {
        switch self {
            case .high: return self.rawValue
            case .middle: return self.rawValue
            case .low: return self.rawValue
            case .secret: return self.rawValue
        }
    }
}
