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
        NavigationView {
            ScrollView {
                LazyVStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 52)
                        .foregroundColor(.colorStyle(.blue100))
                        .overlay(
                            Text("동네인증하고 나의 집터뷰 신뢰도를 높이세요!")
                                .font(.pretendard(size: 14, weight: .semibold))
                                .foregroundColor(.colorStyle(.blue300))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        )
                        .padding(.top, 12)
                        .padding(.bottom, 8)
                        .padding(.horizontal, 14)
                    VStack {
                        Text("내 정보")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.pretendard(size: 12, weight: .semibold))
                            .padding(.leading, 14)
                            .padding(.top, 16)
                        MyPageListCell(type: .myInfo)

                        CustomDivider(color: .colorStyle(.gray100), height: 17)
                        
                        Text("활동")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.pretendard(size: 12, weight: .semibold))
                            .padding(.leading, 14)
                            .padding(.top, 16)
                        MyPageListCell(type: .active)

                        CustomDivider(color: .colorStyle(.gray100), height: 17)

                        Text("계정")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.pretendard(size: 12, weight: .semibold))
                            .padding(.leading, 14)
                            .padding(.top, 16)
                        
                        MyPageListCell(type: .account)

                        CustomDivider(color: .colorStyle(.gray100), height: 17)
                        
                        HStack {
                            Text("현재 버전")
                                .font(.pretendard(size: 14, weight: .regular))
                            Spacer()
                            Text("v0.0.1")
                                .font(.pretendard(size: 14, weight: .regular))
                                .foregroundColor(.colorStyle(.gray400))
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 14)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .padding(.top, 1)
        }.accentColor(.black)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
