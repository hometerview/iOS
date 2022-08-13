//
//  AccountManageView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/14.
//

import SwiftUI

struct ManageAccountView: View {
    var body: some View {
        VStack {
            Divider()
            ScrollView {
                LazyVStack {
                    Text("계정 정보")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.pretendard(size: 12, weight: .semibold))
                        .padding(.leading, 14)
                        .padding(.top, 16)
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Text("이메일")
                                .font(.pretendard(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            Spacer()
                            Button {

                            } label: {
                                Image("icon_navigation")
                            }
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 14)
                    }
                    BoldDivider()
                    Text("기타")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.pretendard(size: 12, weight: .semibold))
                        .padding(.leading, 14)
                        .padding(.top, 16)
                    NavigationLink {
                        TermsOfServiceView()
                    } label: {
                        HStack {
                            Text("서비스 이용약관")
                                .font(.pretendard(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            Spacer()
                            Button {

                            } label: {
                                Image("icon_navigation")
                            }
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 14)
                    }
                    NavigationLink {
                        WithdrawalView()
                    } label: {
                        HStack {
                            Text("회원탈퇴")
                                .font(.pretendard(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            Spacer()
                            Button {

                            } label: {
                                Image("icon_navigation")
                            }
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 14)
                    }
                }
            }
            .navigationTitle("계정 관리")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 1)
        }
    }
}

struct AccountManageView_Previews: PreviewProvider {
    static var previews: some View {
        ManageAccountView()
    }
}
