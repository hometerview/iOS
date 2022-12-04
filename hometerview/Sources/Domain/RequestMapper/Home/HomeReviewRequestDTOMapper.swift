//
//  HomeReviewRequestMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation

extension HomeReviewRequestDTO {
    func toData() -> HomeReviewRequest {
        return .init(parameters: [
            "cityId": cityId,
            "buildingId": buildingId
        ])
    }
}
