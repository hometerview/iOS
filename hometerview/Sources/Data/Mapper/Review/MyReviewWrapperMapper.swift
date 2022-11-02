//
//  MyReviewWrapperMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/09/12.
//

import Foundation

extension MyReviewWrapperDTO {
    func toDomain() -> MyReviewWrapper {
        return .init(data: data?.compactMap({ $0.toDomain() }), message: message, responseCode: responseCode)
    }
}
