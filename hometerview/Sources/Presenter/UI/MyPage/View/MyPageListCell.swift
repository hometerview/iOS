//
//  MyPageListCell.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/13.
//

import SwiftUI

enum MyPageCellType {
    case myInfo
    case account
    case active
    
    func menus() -> [String] {
        switch self {
        case .myInfo:
            return ["닉네임", "집", "직장"]
        case .account:
            return ["계정 관리", "로그아웃"]
        case .active:
            return ["내가 작성한 집터뷰", "최근에 본 집터뷰"]
        }
    }
}

struct MyPageListCell: View {
    let type: MyPageCellType
    
    struct NameCell: View {
        var body: some View {
            HStack {
                Text("닉네임")
                    .font(.pretendard(size: 14, weight: .regular))
                Spacer()
                HStack {
                    NavigationLink(destination: NicknameEditView()) {
                        Image("icon_edit")
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                    Text("김길동")
                        .foregroundColor(.colorStyle(.gray800))
                        .font(.pretendard(size: 14, weight: .regular))
                }
            }.padding(.horizontal, 14)
        }
    }

    struct HomeCell: View {
        var body: some View {
            HStack {
                Text("집")
                    .font(.pretendard(size: 14, weight: .regular))
                Spacer()
                VStack(alignment: .trailing, spacing: 8) {
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 72, height: 16)
                        .foregroundColor(.colorStyle(.gray100))
                        .overlay(
                            Text("동네인증 미완료")
                                .foregroundColor(Color.colorStyle(.gray500))
                                .font(.pretendard(size: 10, weight: .regular))
                                .padding(.vertical, 2)
                                .padding(.horizontal, 4)
                        )
                    Text("경기도 평택동")
                        .foregroundColor(.colorStyle(.gray800))
                        .font(.pretendard(size: 14, weight: .regular))
                    Text("평택역")
                        .foregroundColor(.colorStyle(.gray400))
                        .font(.pretendard(size: 12, weight: .regular))
                }
            }.padding(.horizontal, 14)
        }
    }

    struct CompanyCell: View {
        var body: some View {
            HStack {
                Text("직장")
                    .font(.pretendard(size: 14, weight: .regular))
                Spacer()
                VStack(alignment: .trailing, spacing: 8) {
                    Text("삼성전자 서울 R&D캠퍼스")
                        .foregroundColor(.colorStyle(.gray800))
                        .font(.pretendard(size: 14, weight: .regular))
                    HStack {
                        Text("서울특별시 서초구 성촌길 56")
                            .foregroundColor(.colorStyle(.gray400))
                            .font(.pretendard(size: 12, weight: .regular))
                        Image(systemName: "circle.fill")
                            .foregroundColor(.colorStyle(.gray400))
                            .font(.system(size: 2))
                        Text("동탄역")
                            .foregroundColor(.colorStyle(.gray400))
                            .font(.pretendard(size: 12, weight: .regular))
                    }
                }
            }.padding(.horizontal, 14)
        }
    }

    var body: some View {
        switch type {
        case .myInfo:
            ForEach(0..<type.menus().count, id: \.self) { index in
                if index == 0 {
                    NameCell()
                } else if index == 1 {
                    HomeCell()
                } else {
                    CompanyCell()
                }
            }.padding(.vertical, 16)
        case .account, .active:
            ForEach(0..<type.menus().count, id: \.self) { index in
                NavigationLink {
                    
                } label: {
                    HStack {
                        Text(type.menus()[index])
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
                if index < type.menus().count - 1 {
                    Divider()
                }
            }
        }
    }
}

struct MyPageListCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPageListCell(type: .myInfo)
    }
}
