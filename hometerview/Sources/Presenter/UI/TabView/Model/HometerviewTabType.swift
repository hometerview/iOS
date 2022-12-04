//
//  HometerviewTabType.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/02.
//

import SwiftUI

// 지도, 위시리스트 2차 페이즈
enum HometerviewTabType {
    case home
//    case map
//    case wish
    case myPage

    var iconImageName: String {
        switch self {
            case .home: return "icon_home"
//            case .map: return "icon_mapd"
//            case .wish: return "icon_heart"
            case .myPage: return "icon_user"
        }
    }

    @ViewBuilder func view() -> some View {
        switch self {
            case .home: HomeView()
//            case .map: MapView()
//            case .wish: WishView()
            case .myPage: MyPageView()
        }
    }
}

extension HometerviewTabType: CaseIterable, Hashable { }
