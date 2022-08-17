//
//  AppleLoginView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/07/27.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginView: View {
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.email]
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                switch authResults.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    print(credential)

                    if let identityToken = credential.identityToken {
                        let identityTokenString = String(data: identityToken, encoding: .utf8)
                        print(identityTokenString)
                    }
                default:
                    break
                }
            case .failure(let error):
                print(error)
            }
        }
        .signInWithAppleButtonStyle(.black)
    }
}

struct AppleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginView()
    }
}
