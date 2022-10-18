//
//  hometerviewApp.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/09.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

@main
struct hometerviewApp: App {
    @UIApplicationDelegateAdaptor var dleegate: AppDelegate
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

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        KakaoSDK.initSDK(appKey: "f811c290471ec82c6e65a3c0c68a3bbc")

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }

        return false
    }
}
