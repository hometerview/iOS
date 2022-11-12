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

    func requestLogin(authType: AuthType) {
        switch authType {
            case .kakao:
                requestKakaoLogin()
            case .apple:
                requestAppleLogin()
        }
    }

    private func requestKakaoLogin() {
        
    }

    private func requestAppleLogin() {

    }
}
