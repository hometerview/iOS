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
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                print(authResults)
            case .failure(let error):
                print(error)
            }
        }
        .signInWithAppleButtonStyle(.whiteOutline)
    }
}

struct AppleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginView()
    }
}
