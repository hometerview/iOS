//
//  MainViewModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/10.
//

import Foundation

protocol MainViewModelInterface { }

class MainViewModel: BaseViewModel, 
                     MainViewModelInterface {
    let loginUseCase: LoginUseCaseInterface

    init(loginUseCase: LoginUseCaseInterface = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }

    func requestKakaoLogin(accessToken: String, refreshToken: String) {
        let requestDTO = KakaoLoginRequestDTO(accessToken: accessToken, refreshToken: refreshToken)

        loginUseCase.requestKakaoLogin(requestDTO: requestDTO)
            .sink { result in
                switch result {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            } receiveValue: { _ in
                Log.info("카카오 로그인 성공")
            }.store(in: &cancellable)
    }

    func requestAppleLogin() {

    }
}
