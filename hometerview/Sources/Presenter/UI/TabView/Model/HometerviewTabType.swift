//
//  HometerviewTabType.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/02.
//

import SwiftUI

enum HometerviewTabType {
    case home
    case map
    case wish
    case myPage

    var iconImageName: String {
        switch self {
            case .home: return "icon_home"
            case .map: return "icon_map"
            case .wish: return "icon_heart"
            case .myPage: return "icon_user"
        }
    }

    @ViewBuilder func view() -> some View {
        switch self {
            case .home: HomeView()
            case .map: MapView()
            case .wish: WishView()
            case .myPage: MyPageView()
        }
    }
}

extension HometerviewTabType: CaseIterable, Hashable { }
