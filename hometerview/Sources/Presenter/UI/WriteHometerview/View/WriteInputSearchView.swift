//
//  WriteInputSearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/16.
//

import SwiftUI

struct HometerviewSearchView: View {
    @StateObject private var viewModel: HometerviewViewModel = HometerviewViewModel()
    @Binding var isShowFullCover: Bool
    @State private var isShowDismissAlert: Bool = false
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.colorStyle(.blueGrey100)
                    .ignoresSafeArea()

                VStack {
                    HometerviewHeader(isShowDismissAlert: $isShowDismissAlert, progressValue: 37, showBackButton: false)

                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            Text("주소")
                                .foregroundColor(.colorStyle(.gray800))
                                .font(.pretendard(size: 14))
                                .padding(.top, 24)
                                .padding(.bottom, 16)
                                .padding(.horizontal)

                            customSearchBar

                            if searchText == "" {
                                addressGuideline
                            } else {
                                companyList
                                    .transition(.opacity.animation(.easeInOut(duration: 0.2)))
                            }
                        }
                    }

                    Spacer()
                }
            }
            .modifier(AskDismissAlertModifier(
                isShowFullCover: $isShowFullCover,
                isShowAlert: $isShowDismissAlert,
                alertType: .hometerview))
            .navigationBarHidden(true)
        }
    }

    var addressGuideline: some View {
        VStack(alignment: .leading) {
            Text("안심하세요! 작성자의 정보는 노출되지 않아요!")
                .foregroundColor(.colorStyle(.blue300))
                .font(.pretendard(size: 12, weight: .medium))

            AddressGuidelineView()
                .padding(.top, 40)
                .padding(.horizontal, 24)
        }
        .padding(.horizontal)
    }

    var companyList: some View {
        ForEach(0..<5, id: \.self) { index in
            LazyVStack(alignment: .leading, spacing: 10) {
                NavigationLink {
                    LivingFloorView(viewModel: viewModel, isShowFullCover: $isShowFullCover)
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

    var customSearchBar: some View {
        ZStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.init(hex: "#4754F0"))
                TextField("검색", text: $searchText)
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

struct HometerviewSearchViewPreview: PreviewProvider {
    static var previews: some View {
        HometerviewSearchView(isShowFullCover: .constant(true))
    }
}
