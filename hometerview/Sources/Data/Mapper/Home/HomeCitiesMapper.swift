//
//  HomeCitiesMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation

extension HomeCitiesDTO {
    func toDomain() -> HomeCities {
        return .init(cityId: cityId, cityName: cityName)
    }
}
