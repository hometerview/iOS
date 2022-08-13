//
//  MainTabView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: Int = 0

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image("icon_home")
                }
                .tag(0)

            MapView()
                .tabItem {
                    Image("icon_map")
                }
                .tag(1)

            WishView()
                .tabItem {
                    Image("icon_heart")
                }
                .tag(2)

            MyPageView()
                .tabItem {
                    Image("icon_user")
                }
                .tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
