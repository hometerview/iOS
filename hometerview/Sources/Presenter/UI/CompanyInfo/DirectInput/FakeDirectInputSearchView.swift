//
//  FakeDirectInputSearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct FakeDirectInputSearchView: View {
    @Binding var isTapFakeSearchBar: Bool
    let searchBarNamespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("검색 정보가 뜨지 않는다면\n주소를 입력해주세요.")
                .font(.pretendard(size: 20, weight: .medium))
                .padding(.bottom, 35)


            fakeSearchBar

            Spacer()
        }
        .padding()
    }

    var fakeSearchBar: some View {
        VStack(alignment: .leading) {
            Text("주소 검색")
                .font(.pretendard(size: 14))
            

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
}

