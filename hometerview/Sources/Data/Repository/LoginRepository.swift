//
//  LoginRepository.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation
import Combine

struct LoginRepository: LoginRepositoryInterface {
    private let service: LoginServiceInterface

    init(service: LoginServiceInterface = LoginService()) {
        self.service = service
    }

    func kakao(request: KakaoLoginRequest) -> AnyPublisher<EmptyEntity?, Error> {
        return service.kakao(request: request)
            .eraseToAnyPublisher()
    }
}
