//
//  AppDelegate.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/18.
//

import Foundation

import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

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
