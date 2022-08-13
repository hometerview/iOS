//
//  MyPageListCell.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/13.
//

import SwiftUI

enum MyPageList {
    case mypage
    case account
    case active
    
    func menus() -> [String] {
        switch self {
        case .mypage:
            return ["닉네임", "집", "직장"]
        case .account:
            return ["계정 관리", "로그아웃"]
        case .active:
            return ["내가 작성한 집터뷰", "최근에 본 집터뷰"]
        }
    }
}

struct MyPageListCell: View {
    let menus: [String]
    
    var body: some View {
        ForEach(0..<menus.count, id: \.self) { index in
            Text(menus[index])
                .font(.pretendard(size: 14, weight: .regular))
                .foregroundColor(.black)
        }
    }
}

struct MyPageListCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPageListCell(menus: MyPageList.mypage.menus())
    }
}
