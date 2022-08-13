//
//  EnterCompanySearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct EnterCompanySearchView: View {
    @Binding var isTapFakeSearchBar: Bool
    @State private var searchText: String = ""
    @State private var isShowContents: Bool = false
    let searchBarNamespace: Namespace.ID

    var body: some View {
        ZStack {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    companySearchBar

                    if isShowContents {
                        Group {
                            notFoundCompanyButton

                            companyList
                        }
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
                companyListCell(index: index)
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(4)
    }


    @ViewBuilder func companyListCell(index: Int) -> some View {
        Group {
            Text("삼성전자")
                .font(.pretendard(size: 16, weight: .semibold))


            HStack {
                Text("서울시 마포구 흥정로 32, 34")
                    .font(.pretendard(size: 13, weight: .medium))

                Spacer()

                Text("삼성전자")
                    .font(.pretendard(size: 11, weight: .medium))
                    .foregroundColor(.colorStyle(.blue300))
                Image(systemName: "chevron.right")
                    .font(.pretendard(size: 9, weight: .medium))
                    .foregroundColor(.colorStyle(.blue300))
            }
        }
    }

    var notFoundCompanyButton: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("검색한 주소 근처 역을 기준으로 주거정보를 제공해줘요!")
                .font(.pretendard(size: 11, weight: .semibold))
                .foregroundColor(.colorStyle(.blue300))

            Text("내가 찾는 회사가 없어요")
                .font(.pretendard(size: 12, weight: .semibold))
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
    }

    var companySearchBar: some View {
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

struct EnterCompanySearchViewPreview: PreviewProvider {
    @Namespace static var test

    static var previews: some View {
        EnterCompanySearchView(isTapFakeSearchBar: .constant(false), searchBarNamespace: test)
    }
}
