//
//  MyReviewDTO.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

struct MyReviewWrapperDTO: Decodable {
    let data: [MyReviewDTO]?
    let message: String
    let responseCode: String
}

struct MyReviewDTO: Decodable {
    let isBookmakred: Bool
//    "isBookmarked": true,
//    "isLiked": true,
//    "review": {
//      "advantage": "string",
//      "bookmarkCount": 0,
//      "buildingId": "string",
//      "certification": [
//        "string"
//      ],
//      "companyId": "string",
//      "disadvantage": "string",
//      "id": {
//        "date": "2022-09-12T12:33:45.921Z",
//        "timestamp": 0
//      },
//      "likeCount": 0,
//      "memberId": "string",
//      "period": "string",
//      "price": {
//        "deposit": "string",
//        "maintainFee": "string",
//        "monthly": "string"
//      },
//      "rating": 0
}
