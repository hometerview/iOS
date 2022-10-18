//
//  hometerviewApp.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/09.
//

import SwiftUI

import KakaoSDKAuth

@main
struct hometerviewApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    @StateObject private var user = User.shared

    var body: some Scene {
        WindowGroup {
            Group {
                switch user.status {
                    case .unAuthenticated:
                        MainView()
                            .onOpenURL { url in
                                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                                    _ = AuthController.handleOpenUrl(url: url)
                                }
                            }
                    case .authenticated:
                        MainTabView()
                    case .guest:
                        MainTabView()
                }
            }
        }
    }
}
