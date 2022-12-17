//
//  LoginRepositoryInterface.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/12/05.
//

import Foundation
import Combine

protocol LoginRepositoryInterface {
    func kakao(request: KakaoLoginRequest) -> AnyPublisher<EmptyEntity?, Error>
}
