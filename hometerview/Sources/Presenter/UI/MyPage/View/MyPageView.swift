//
//  MyPageView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct MyPageView: View {
    @StateObject private var viewModel = MyPageViewModel()
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 52)
                .foregroundColor(.colorStyle(.blue100))
                .overlay(
                    Text("동네인증하고 나의 집터뷰 신뢰도를 높이세요!")
                        .font(.pretendard(size: 14, weight: .semibold))
                        .foregroundColor(.colorStyle(.blue300))
                        .padding()
                )
                .padding(.top, 12)
                .padding(.horizontal, 14)
            List {
                Section(header: Text("내 정보").font(.pretendard(size: 14, weight: .semibold))) {
                    MyPageListCell(menus: MyPageList.mypage.menus())
                }.listStyle(.plain)
                Section(header: Text("활동").font(.pretendard(size: 14, weight: .semibold))) {
                    MyPageListCell(menus: MyPageList.active.menus())
                }.listStyle(.plain)
                Section(header: Text("계정").font(.pretendard(size: 14, weight: .semibold))) {
                    MyPageListCell(menus: MyPageList.account.menus())
                }.listStyle(.plain)
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
