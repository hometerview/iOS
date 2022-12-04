//
//  HomeReviewPriceMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation

extension HomeReviewPriceDTO {
    func toDomain() -> HomeReviewPrice {
        return .init(deposit: deposit,
                     maintainFee: maintainFee,
                     monthly: monthly)
    }
}
