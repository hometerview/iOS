//
//  HomeReviewMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation

extension HomeReviewDTO {
    func toDomain() -> HomeReview {
        return .init(advantage: advantage, buildingId: buildingId, disadvantage: disadvantage, rating: rating, reviewId: reviewId, buildingType: buildingType, buildingName: buildingName)
    }
}
