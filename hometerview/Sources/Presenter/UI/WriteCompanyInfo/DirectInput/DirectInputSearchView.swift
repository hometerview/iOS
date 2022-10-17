//
//  DirectInputSearchView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct DirectInputSearchView: View {
    @State private var searchText: String = ""
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
            .navigationBarItems(leading: BackButton(), trailing: SimpleCancelButton(isActive: $isShowFullCover))
        }
    }

    var guidelineText: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("TIP")
                .font(.pretendard(size: 14, weight: .semibold))
            Text("아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.")
                .padding(.bottom, 8)

            Text("도로명 + 건물번호")
            Text("예) 판교역로 235, 제주 첨단로 242")
                .foregroundColor(.colorStyle(.blue300))
                .padding(.bottom, 8)

            Text("지역명(동/리) + 번지")
            Text("예) 삼평동 681, 제주 영평동 2181")
                .foregroundColor(.colorStyle(.blue300))
                .padding(.bottom, 8)

            Text("지역명(동/리) + 건물명(아파트명)")
            Text("예) 분당 주공, 연수동 주공3차")
                .foregroundColor(.colorStyle(.blue300))
                .padding(.bottom, 8)

            Text("사서함명 + 번호")
            Text("예) 분당우체국사서함 1~100")
                .foregroundColor(.colorStyle(.blue300))
        }
        .font(.pretendard(size: 10))
        .foregroundColor(.colorStyle(.gray900))
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
        .padding(.horizontal)
    }
}

struct DirectInputSearchViewPreview: PreviewProvider {
    @Namespace static var test

    static var previews: some View {
        DirectInputSearchView(isShowFullCover: .constant(true))
    }
}
