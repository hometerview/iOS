//
//  RateStarModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import Foundation

enum RateStarModel: Int {
    static let starCount: Int = 5

    case none = 0
    case one = 1
    case two
    case three
    case four
    case five


    var index: Int {
        switch self {
            case .one: return self.rawValue
            case .two: return self.rawValue
            case .three: return self.rawValue
            case .four: return self.rawValue
            case .five: return self.rawValue
            case .none: return -1
        }
    }
}
