//
//  KakaoLoginRequestDTOMapper.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation

extension KakaoLoginRequestDTO {
    func toData() -> KakaoLoginRequest {
        return .init(parameters: [
            "accessToken": accessToken as Any,
            "refreshToken": refreshToken as Any
        ])
    }
}
