//
//  hometerviewApp.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/09.
//

import SwiftUI

@main
struct hometerviewApp: App {
    @StateObject private var user = User.shared

    var body: some Scene {
        WindowGroup {
            switch user.status {
                case .unAuthenticated:
                    MainView()
                case .authenticated:
                    MainTabView()
                case .guest:
                    MainTabView()
            }
        }
    }
}
