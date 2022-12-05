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
    let loginRepsitory: LoginRepositoryInterface

    init(repository: LoginRepositoryInterface = LoginRepository()) {
        self.loginRepsitory = repository
    }

    func requestKakaoLogin(requestDTO: KakaoLoginRequestDTO) -> AnyPublisher<EmptyEntity?, Error> {
        let request = requestDTO.toData()
        return loginRepsitory.kakao(request: request)
    }
}
