//
//  MyReviewRequestDTOMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

extension MyReviewRequestDTO {
    func toData() -> MyReviewRequest {
        return .init(parameters: [
            "offset": offset as Any,
            "pageNumber": pageNumber as Any,
            "pageSize": pageSize as Any
        ])
    }
}
