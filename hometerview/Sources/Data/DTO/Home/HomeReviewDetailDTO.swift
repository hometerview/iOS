//
//  HomeReviewDetail.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation

struct HomeReviewDetailDTO: Decodable {
    let advantage: String
    let bookmarkCount: Int
    let buildingId: String
    let certification: [String]
    let companyId: String
    let disadvantage: String
    let floor: String
    let id: String
    let likeCount: Int
    let memberId: String
    let period: Int
    let price: HomeReviewPriceDTO
    let rating: Float
}
