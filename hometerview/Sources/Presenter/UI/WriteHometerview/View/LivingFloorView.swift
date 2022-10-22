//
//  LivingFloorView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import SwiftUI

struct LivingFloorView: View {
    @ObservedObject var viewModel: HometerviewViewModel
    @State private var isShowLivingFloorList: Bool = false
    @State private var selectedIndex: Int? = nil
    @State private var selectedLivingFloorTitle: String? = nil
    @State private var isShowDismissAlert: Bool = false
    @Binding var isShowFullCover: Bool


    var body: some View {
        ZStack(alignment: .top) {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                HometerviewHeader(isShowDismissAlert: $isShowDismissAlert, progressValue: 37)

                banner

                companyAddress

                livingFloor

                Spacer()

                nextButton
            }
        }
        .navigationBarHidden(true)
        .modifier(
            ListPopupModifier(
                selectedIndex: $selectedIndex,
                isShowing: $isShowLivingFloorList,
                listContents: viewModel.livingFloorModelTitles))
        .modifier(AskDismissAlertModifier(
            isShowFullCover: $isShowFullCover,
            isShowAlert: $isShowDismissAlert,
            alertType: .hometerview))
        .onChange(of: selectedIndex) { newValue in
            if let index = selectedIndex {
                selectedLivingFloorTitle =  viewModel.assignSelectedLivingFloorTitle(index: index)
            }
        }
    }

    var banner: some View {
        Text("지금 집이라면?\n위치인증으로 집터뷰 신뢰도를 높여보세요!")
            .font(.pretendard(size: 14, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineSpacing(4)
            .foregroundColor(.colorStyle(.blue300))
            .padding()
            .background(Color.colorStyle(.blue100))
            .cornerRadius(8)
            .padding()
            .padding(.bottom, 8)
    }

    var nextButton: some View {
        NavigationLink {
            StarRatingView(viewModel: viewModel, isShowFullCover: $isShowFullCover)
        } label: {
            Text("다음")
                .foregroundColor(.white)
                .font(.pretendard(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(selectedIndex == nil ? Color.colorStyle(.gray200) : Color.colorStyle(.blue300))
                .disabled(selectedIndex == nil)
                .cornerRadius(8)
        }.simultaneousGesture(TapGesture().onEnded({
            if let index = selectedIndex {
                viewModel.selectedLivingFloorTitle =  viewModel.assignSelectedLivingFloorTitle(index: index)
            }
        }))
        .padding(.horizontal)
    }

    var companyAddress: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("주소")
                .font(.pretendard(size: 14, weight: .regular))
                .foregroundColor(.colorStyle(.gray600))

            Text("서울시 마포구 문화로 32-3길 휘경상가")
                .font(.pretendard(size: 14, weight: .medium))
                .foregroundColor(.colorStyle(.gray900))
        }
        .padding(.bottom, 24)
        .padding(.horizontal)
    }

    var livingFloor: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("거주층")
                .font(.pretendard(size: 14, weight: .regular))
                .foregroundColor(.colorStyle(.gray600))

            ZStack {
                HStack {
                    Text(selectedLivingFloorTitle ?? "거주층을 선택해주세요")
                        .foregroundColor(selectedLivingFloorTitle == nil ? .colorStyle(.gray400) : .colorStyle(.gray900))
                        .font(.pretendard(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "chevron.down")
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
            .onTapGesture {
                isShowLivingFloorList = true
            }
        }
        .padding(.horizontal)
    }

    var header: some View {
        ZStack {
            Text("집터뷰 작성")
                .font(.pretendard(size: 15, weight: .medium))

            HStack {
                Spacer()

                SimpleCancelButton(isActive: $isShowFullCover)
            }
        }
        .padding()
    }
}

struct LivingFloorView_Previews: PreviewProvider {
    static var previews: some View {
        LivingFloorView(viewModel: HometerviewViewModel(), isShowFullCover: .constant(true))
    }
}
