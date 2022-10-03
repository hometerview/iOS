//
//  PickerTabType.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/19.
//

import Foundation

enum PickerTabType: Int, CustomStringConvertible, CaseIterable, Hashable {
    case review = 0
    case building = 1

    var description: String {
        switch self {
            case .review: return "저장한 리뷰"
            case .building: return "저장한 건물"
        }
    }

    static var titles: [String] {
        return PickerTabType.allCases.map({ $0.description })
    }
}
