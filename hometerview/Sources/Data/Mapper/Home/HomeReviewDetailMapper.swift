//
//  HomeReviewDetailMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation

extension HomeReviewDetailDTO {
    func toDomain() -> HomeReviewDetail {
        return .init(advantage: advantage,
                     bookmarkCount: bookmarkCount,
                     buildingId: buildingId,
                     certification: certification,
                     companyId: companyId,
                     disadvantage: disadvantage,
                     floor: floor,
                     id: id,
                     likeCount: likeCount,
                     memberId: memberId,
                     period: period,
                     price: price.toDomain(),
                     rating: rating)
    }
}
