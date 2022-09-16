//
//  AppleLoginView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/07/27.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginView: View {
    private var buttonSize: CGFloat = 36

    var body: some View {
        HStack {
            Button {

            } label : {
                Image("apple")
                    .padding(.leading, 14)
                Spacer()
                Text("Apple로 시작하기")
                    .font(.pretendard(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.leading, -buttonSize)
                Spacer()
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.black)
        }
    }
    
//    var body: some View {
//        SignInWithAppleButton(.continue) { request in
//            request.requestedScopes = [.email, .fullName]
//        } onCompletion: { result in
//            switch result {
//            case .success(let authResults):
//
//                switch authResults.credential {
//
//                case let credential as ASAuthorizationAppleIDCredential:
//                    print(credential)
//                default:
//                    break
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//        .frame(height: 50)
//        .frame(maxWidth: .infinity)
//        .signInWithAppleButtonStyle(.black)
//    }
}

struct AppleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginView()
    }
}
