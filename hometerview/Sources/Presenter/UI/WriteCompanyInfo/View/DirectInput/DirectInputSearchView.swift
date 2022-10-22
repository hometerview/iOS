//
//  DirectInputSearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct DirectInputSearchView: View {
    @State private var searchText: String = ""
    @State private var isShowDismissAlert: Bool = false
    @Binding var isShowFullCover: Bool

    var body: some View {
        ZStack {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    CustomDivider(color: .colorStyle(.gray200), height: 1)

                    header

                    customSearchBar

                    if searchText == "" {
                        guidelineText
                    } else {
                        companyList
                            .transition(.opacity.animation(.easeInOut(duration: 0.2)))
                    }
                }
            }
            .navigationTitle("회사 정보 입력")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(), trailing: SimpleCancelButton(isActive: $isShowDismissAlert))
            .modifier(AskDismissAlertModifier(
                isShowFullCover: $isShowFullCover,
                isShowAlert: $isShowDismissAlert,
                alertType: .enterCompany))
        }
    }

    var guidelineText: some View {
        AddressGuidelineView()
            .padding(.top, 40)
            .padding(.horizontal, 24)
    }

    var companyList: some View {
        ForEach(0..<5, id: \.self) { index in
            LazyVStack(alignment: .leading, spacing: 10) {
                NavigationLink {
                    CompanyNameInputView(isShowFullCover: $isShowFullCover)
                } label: {
                    Text("서울시 마포구 문화로 32-1 석규빌딩")
                        .font(.pretendard(size: 14))
                        .padding(.horizontal)
                        .frame(height: 46)
                        .foregroundColor(.colorStyle(.gray900))
                }

                CustomDivider(color: .colorStyle(.gray100), height: 1)
            }
        }
    }

    var header: some View {
        Text("주소")
            .font(.pretendard(size: 14))
            .padding(.top, 24)
            .padding(.bottom, 16)
            .padding(.horizontal)
    }

    var customSearchBar: some View {
        ZStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.init(hex: "#4754F0"))
                TextField("건물 주소를 검색해 주세요", text: $searchText)
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
        }
        .padding(.horizontal)
    }
}

struct DirectInputSearchViewPreview: PreviewProvider {
    @Namespace static var test

    static var previews: some View {
        DirectInputSearchView(isShowFullCover: .constant(true))
    }
}
