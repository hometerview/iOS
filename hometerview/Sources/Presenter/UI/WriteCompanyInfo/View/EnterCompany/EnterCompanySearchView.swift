//
//  EnterCompanySearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct EnterCompanySearchView: View {
    @State private var searchText: String = ""
    @State private var isShowDismissAlert: Bool = false
    @Binding var isShowFullCover: Bool

    var body: some View {
        NavigationView {
            ZStack {
                Color.colorStyle(.blueGrey100)
                    .ignoresSafeArea()

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        CustomDivider(color: .colorStyle(.gray200), height: 1)

                        companySearchBar

                        if searchText != "" {
                            Group {
                                companyList
                            }
                            .transition(.opacity.animation(.easeInOut(duration: 0.2)))
                        }
                    }
                }
            }
            .navigationTitle("회사 정보 입력")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: SimpleCancelButton(isActive: $isShowDismissAlert))
            .modifier(AskDismissAlertModifier(
                isShowFullCover: $isShowFullCover,
                isShowAlert: $isShowDismissAlert))
        }
    }

    var companyList: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            notFoundCompanyButton

            CustomDivider(color: .colorStyle(.gray100), height: 1)

            ForEach(0..<5, id: \.self) { index in
                companyListCell(index: index)

                CustomDivider(color: .colorStyle(.gray100), height: 1)
            }
        }
        .padding(.vertical, 16)
        .cornerRadius(4)
    }


    @ViewBuilder func companyListCell(index: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("삼성전자")
                .font(.pretendard(size: 14, weight: .regular))

            HStack(alignment: .center) {
                Text("서울시 마포구 흥정로 32, 34")
                    .font(.pretendard(size: 12, weight: .regular))
                    .foregroundColor(.colorStyle(.gray600))

                Spacer()

                Text("을지로입구역으로 검색")
                    .font(.pretendard(size: 11, weight: .medium))
                    .foregroundColor(.colorStyle(.blue300))
            }
        }
        .frame(height: 66)
        .padding(.horizontal)
    }

    var notFoundCompanyButton: some View {
        NavigationLink {
            DirectInputSearchView(isShowFullCover: $isShowFullCover)
        } label: {
            HStack(alignment: .center, spacing: 7) {
                Text("내가 찾는 회사가 없어요")
                    .font(.pretendard(size: 14, weight: .regular))

                Spacer()

                Image("icon_next")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .foregroundColor(.colorStyle(.gray900))
            .frame(height: 66)
            .padding(.horizontal)
        }
    }

    var companySearchBar: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.init(hex: "#4754F0"))
                TextField("회사를 검색해 주세요", text: $searchText)
                    .introspectTextField { textField in
                        textField.becomeFirstResponder()
                    }
            }
            .padding()
            .foregroundColor(searchText == "" ? Color.colorStyle(.gray400) : Color.colorStyle(.gray900))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.init(hex: "D4DBEB"))
                    .frame(height: 50)
            )

            Text("검색한 주소 근처 역을 기준으로 주거정보를 제공해줘요!")
                .font(.pretendard(size: 12, weight: .medium))
                .foregroundColor(.colorStyle(.blue300))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

struct EnterCompanySearchViewPreview: PreviewProvider {
    @Namespace static var test

    static var previews: some View {
        EnterCompanySearchView(isShowFullCover: .constant(true))
    }
}
