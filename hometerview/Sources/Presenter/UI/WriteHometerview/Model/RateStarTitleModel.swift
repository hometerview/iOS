//
//  RateStarTitleModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/14.
//

import Foundation

enum RateStarTitleModel: Int, CustomStringConvertible {
    case none = 0
    case one = 1
    case two
    case three
    case four
    case five

    var description: String {
        switch self {
            case .none: return "별점을 입력해주세요"
            case .one: return "별로에요"
            case .two: return "그저그래요"
            case .three: return "괜찮아요"
            case .four: return "좋아요"
            case .five: return "최고에요"
        }
    }
}
