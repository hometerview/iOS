//
//  StepEnterCompanyView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/17.
//

import SwiftUI

struct StepEnterCompanyView: View {
    @State private var companyName: String?
    @State private var isShowEnterCompanyFullCover: Bool = false
    @State private var isShowDismissAlert: Bool = false
    @Binding var isShowFullCover: Bool

    var body: some View {
        ZStack(alignment: .top) {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                HometerviewHeader(isShowDismissAlert: $isShowDismissAlert, progressValue: 99)

                description

                searchBar

                Spacer()

                okButton
            }
        }
        .modifier(AskDismissAlertModifier(
            isShowFullCover: $isShowFullCover,
            isShowAlert: $isShowDismissAlert,
            alertType: .hometerview))
        .fullScreenCover(isPresented: $isShowEnterCompanyFullCover) {
            EnterCompanySearchView(isShowFullCover: $isShowEnterCompanyFullCover)
        }
        .navigationBarHidden(true)
    }

    var description: some View {
        Text("이 집에서 통근하던 직장을 입력해 주세요 (선택사항)")
            .foregroundColor(.colorStyle(.gray800))
            .padding(.horizontal)
            .padding(.top, 24)
            .padding(.bottom, 8)
    }

    var searchBar: some View {
        ZStack {
            HStack {
                Text(companyName ?? "직장을 검색해 주세요")
                    .font(.pretendard(size: 14))
                    .foregroundColor(companyName == nil ? .colorStyle(.gray400) : .colorStyle(.gray900))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        HStack {
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 16))
                        }
                    )
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.init(hex: "D4DBEB"))
                    .frame(height: 50)
            )
        }
        .contentShape(Rectangle())
        .padding(.horizontal)
        .onTapGesture {
            #warning("직장 검색 프로세스에서 넘겨받아야 함")
            Log.info("직장 검색 프로세스")
            isShowEnterCompanyFullCover = true
        }
    }

    var okButton: some View {
        Button {
            isShowFullCover = false
        } label: {
            Text("다음")
                .foregroundColor(.white)
                .font(.pretendard(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.colorStyle(.blue300))
                .cornerRadius(8)
                .padding(.horizontal)
        }
    }
}

struct StepEnterCompanyViewPreview: PreviewProvider {
    static var previews: some View {
        StepEnterCompanyView(isShowFullCover: .constant(true))
    }
}
