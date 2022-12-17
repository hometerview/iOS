//
//  HomeCitiesRequestDTOMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation

extension HomeCitiesRequestDTO {
    func toData() -> HomeCitiesRequest {
        return .init(parameters: [
            "companyId": companyId
        ])
    }
}
