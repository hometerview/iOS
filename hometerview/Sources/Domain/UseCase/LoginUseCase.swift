//
//  LoginUseCase.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation
import Combine

protocol LoginUseCaseInterface {
    func requestKakaoLogin(requestDTO: KakaoLoginRequestDTO) -> AnyPublisher<EmptyEntity?, Error>
}

class LoginUseCase: LoginUseCaseInterface {
    let loginService: LoginServiceInterface

    init(service: LoginServiceInterface = LoginService()) {
        self.loginService = service
    }

    func requestKakaoLogin(requestDTO: KakaoLoginRequestDTO) -> AnyPublisher<EmptyEntity?, Error> {
        let request = requestDTO.toData()
        return loginService.kakao(request: request)
    }
}
