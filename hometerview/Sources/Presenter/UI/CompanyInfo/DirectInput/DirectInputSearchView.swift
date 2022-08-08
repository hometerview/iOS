//
//  DirectInputSearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct DirectInputSearchView: View {
    @Binding var isTapFakeSearchBar: Bool
    @State private var searchText: String = ""
    let searchBarNamespace: Namespace.ID

    var body: some View {
        ZStack {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    customSearchBar

                    companyList
                }
            }
        }
        .padding()
    }

    var companyList: some View {
        ForEach(0..<5, id: \.self) { index in
            LazyVStack(alignment: .leading, spacing: 10) {
                Text("서울시 마포구 문화로 32-1 석규빌딩")
                    .font(.pretendard(size: 13, weight: .medium))
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

struct DirectInputSearchViewPreview: PreviewProvider {
    @Namespace static var test

    static var previews: some View {
        DirectInputSearchView(isTapFakeSearchBar: .constant(false), searchBarNamespace: test)
    }
}
