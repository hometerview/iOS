//
//  AppleLoginView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/07/27.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginView: View {
    @AppStorage("email") var email: String = ""
    
    var body: some View {
        if email.isEmpty {
            SignInWithAppleButton(.continue) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(let authResults):
                    switch authResults.credential {
                    case let credential as ASAuthorizationAppleIDCredential:
                        if let email = credential.email {
                            self.email = email
                            print(email)
                        }
                    default:
                        break
                    }
                case .failure(let error):
                    print(error)
                }
            }
            .signInWithAppleButtonStyle(.whiteOutline)
        } else {
            
        }
    }
}

struct AppleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginView()
    }
}
