//
//  KakaoLoginView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/07/27.
//

import SwiftUI
import SwiftUI
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

struct KakaoLoginView: View {
    @ObservedObject var viewModel: MainViewModel
    private let buttonSize: CGFloat = 36
    
    var body: some View {
        HStack {
            Button {
                if UserApi.isKakaoTalkLoginAvailable() {
                    UserApi.shared.loginWithKakaoTalk {
                        (oauthToken, error) in
                        viewModel.requestKakaoLogin(accessToken: oauthToken?.accessToken ?? "",
                                                    refreshToken: oauthToken?.refreshToken ?? "")
                    }
                } else {
                    
                }
            } label : {
                Image("kakao")
                    .padding(.leading, 14)
                Spacer()
                Text("카카오로 시작하기")
                    .font(.pretendard(size: 14, weight: .semibold))
                    .foregroundColor(.colorStyle(.unknown191919))
                    .padding(.leading, -buttonSize)
                Spacer()
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.init(hex: "#FAE64C"))
        }
    }
}
