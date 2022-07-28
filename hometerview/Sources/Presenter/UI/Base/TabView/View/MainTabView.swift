//
//  MainTabView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }

            MapView()
                .tabItem {
                    Image(systemName: "map")
                }

            WishView()
                .tabItem {
                    Image(systemName: "heart.fill")
                }

            MyPageView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
