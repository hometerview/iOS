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
    @Binding var isShowFullCover: Bool


    var body: some View {
        ZStack(alignment: .top) {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                HometerviewHeader(isShowFullCover: $isShowFullCover, progressValue: 37)

                Group {
                    companyAddress

                    livingFloor

                    Spacer()

                    nextButton
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
        .navigationBarItems(trailing: SimpleCancelButton(isActive: $isShowFullCover))
        .modifier(
            ListPopupModifier(
                selectedIndex: $selectedIndex,
                isShowing: $isShowLivingFloorList,
                listContents: viewModel.livingFloorModelTitles))
        .onChange(of: selectedIndex) { newValue in
            if let index = newValue {
                viewModel.assignSelectedLivingFloorTitle(index: index)
            }
        }
    }

    var nextButton: some View {
        NavigationLink {
            StarRatingView(viewModel: viewModel, isShowFullCover: $isShowFullCover)
        } label: {
            Text("다음")
                .foregroundColor(.white)
                .font(.pretendard(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(viewModel.selectedLivingFloorTitle == "" ? Color.colorStyle(.gray200) : Color.colorStyle(.blue300))
                .disabled(viewModel.selectedLivingFloorTitle == "")
                .cornerRadius(8)

        }
    }

    var companyAddress: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("회사 주소")
                .font(.pretendard(size: 14, weight: .medium))

            Text("서울시 마포구 문화로 32-3길 휘경상가")
                .font(.pretendard(size: 14, weight: .medium))
                .padding(.bottom, 50)
        }
    }

    var livingFloor: some View {
        VStack {
            Text("거주층")
                .font(.pretendard(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)

            ZStack {
                HStack {
                    Text(viewModel.selectedLivingFloorTitle ?? "")
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
            .onTapGesture {
                isShowLivingFloorList = true
            }
        }
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
