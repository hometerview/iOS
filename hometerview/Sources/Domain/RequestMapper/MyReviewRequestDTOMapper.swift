//
//  MyReviewRequestDTOMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

extension MyReviewRequestDTO {
    func toData() -> MyReviewRequest {
        return .init(offset: offset, pageNumber: pageNumber, pageSize: pageSize)
    }
}
