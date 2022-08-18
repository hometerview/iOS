//
//  PickerTabType.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/19.
//

import Foundation

enum PickerTabType: CustomStringConvertible, CaseIterable, Hashable {
    case review
    case building

    var description: String {
        switch self {
            case .review: return "저장한 리뷰"
            case .building: return "저장한 건물"
        }
    }
}
