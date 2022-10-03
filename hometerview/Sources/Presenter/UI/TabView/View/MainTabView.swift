//
//  MainTabView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: HometerviewTabType = .home

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.colorStyle(.gray200))
    }

    var body: some View {
        TabView(selection: $selection) {
            ForEach(HometerviewTabType.allCases, id: \.self) { type in
                type.view()
                    .tabItem {
                        Image(type.iconImageName)
                            .renderingMode(.template)
                    }
                    .tag(type)
            }
        }
        .accentColor(.colorStyle(.gray800))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
