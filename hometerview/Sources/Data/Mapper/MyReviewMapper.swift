//
//  MyReviewMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

extension MyReviewDTO {
    func toDomain() -> MyReview {
        return .init(isBookmakred: isBookmakred)
    }
}
