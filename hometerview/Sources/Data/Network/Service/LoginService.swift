//
//  LoginService.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/11/12.
//

import Foundation
import Combine

import Alamofire

protocol LoginServiceInterface {
    func kakao(request: KakaoLoginRequest) -> AnyPublisher<EmptyEntity?, Error>
}

struct LoginService: LoginServiceInterface {
    private let network: BaseNetwork

    init(baseNetwork: BaseNetwork = BaseNetworkImpl()) {
        self.network = baseNetwork
    }

    func kakao(request: KakaoLoginRequest) -> AnyPublisher<EmptyEntity?, Error> {
        return network.request(api: request)
            .eraseToAnyPublisher()
    }
}
