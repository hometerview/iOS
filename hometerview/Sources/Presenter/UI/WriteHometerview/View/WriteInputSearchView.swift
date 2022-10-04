//
//  WriteInputSearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/16.
//

import SwiftUI

struct WriteInputSearchView: View {
    @ObservedObject var viewModel: HometerviewViewModel
    @Binding var isTapFakeSearchBar: Bool
    @Binding var isShowFullCover: Bool
    @State private var searchText: String = ""
    @State private var isShowContents: Bool = false
    let searchBarNamespace: Namespace.ID

    var body: some View {
        ZStack {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    customSearchBar

                    if isShowContents {
                        companyList
                        .transition(.opacity.animation(.easeInOut(duration: 0.2)))
                    }
                }
            }
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isShowContents = true
            }
        }
        .onDisappear {
            isShowContents = false
        }
    }

    var companyList: some View {
        ForEach(0..<5, id: \.self) { index in
            LazyVStack(alignment: .leading, spacing: 10) {
                NavigationLink {
                    LivingFloorView(viewModel: viewModel, isShowFullCover: $isShowFullCover)
                } label: {
                    Text("서울시 마포구 문화로 32-1 석규빌딩")
                        .font(.pretendard(size: 13, weight: .medium))
                        .foregroundColor(.colorStyle(.gray900))
                }
            }
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(4)
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
            .foregroundColor(.gray)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.init(hex: "D4DBEB"))
                    .frame(height: 50)
            )
        }
        .matchedGeometryEffect(id: "searchBar", in: searchBarNamespace)
    }
}
