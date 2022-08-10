//
//  EnterCompanyFirstView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct FakeEnterCompanySearchView: View {
    @Binding var isTapFakeSearchBar: Bool
    let searchBarNamespace: Namespace.ID
    let hasCompanyData: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(hasCompanyData ? "회사 이름을 입력해주세요" : "우리는 직장정보 기반으로\n많은 추천을 해드려요")
                .font(.pretendard(size: 20, weight: .medium))
                .padding(.bottom, 35)

            fakeSearchBar

            Spacer()
        }
        .padding()
    }

    var fakeSearchBar: some View {
        ZStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.init(hex: "#4754F0"))
                TextField("검색", text: .constant(""))
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
        .onTapGesture {
            withAnimation {
                isTapFakeSearchBar = true
            }
        }
    }
}

