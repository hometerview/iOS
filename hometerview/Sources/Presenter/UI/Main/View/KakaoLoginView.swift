//
//  KakaoLoginView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/07/27.
//

import SwiftUI
import KakaoSDKUser

struct KakaoLoginView: View {
    var body: some View {
        Button {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    print(oauthToken)
                    print(error)
                }
            } else {
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    print(oauthToken)
                    print(error)
                }
            }
        } label : {
            Text("카카오로 시작하기")
                .font(.pretendard(size: 14, weight: .semibold))
                .foregroundColor(.init(hex: "#191919"))
                .padding()
        }
        .cornerRadius(8)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.init(hex: "#FAE64C"))
    }
}

struct KakaoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        KakaoLoginView()
    }
}
