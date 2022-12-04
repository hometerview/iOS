//
//  HomeReview.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/04.
//

import Foundation

struct HomeReviewDTO: Decodable {
    let advantage: String
    let buildingId: String
    let disadvantage: String
    let rating: Float
    let reviewId: String
    let review: HomeReviewDetailDTO
}
