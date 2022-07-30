//
//  hometerviewApp.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/09.
//

import SwiftUI

@main
struct hometerviewApp: App {
    var body: some Scene {
        WindowGroup {
            switch User.shared.status {
                case .unAuthenticated:
                    MainView()
                case .authenticated:
                    MainTabView()
            }
        }
    }
}
