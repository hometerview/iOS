//
//  StarRatingView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import SwiftUI

struct StarRatingView: View {
    @ObservedObject var viewModel: HometerviewViewModel
    @Binding var isShowFullCover: Bool
    @State private var isShowLengthResidenceList: Bool = false
    @State private var isShowDismissAlert: Bool = false

    // 별점
    @State private var starCount: Int = 0
    // 거주기간
    @State private var selectedListIndex: Int? = nil
    @State private var selectedLengthResidenceTitle: String? = nil
    // 장점
    @State private var meritContents: String = ""
    // 단점
    @State private var weaknessContents: String = ""

    var isEnableNextButton: Bool {
        return meritContents.count > 30 &&
        weaknessContents.count > 30 &&
        selectedListIndex != nil &&
        starCount > 0
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            HometerviewHeader(isShowDismissAlert: $isShowDismissAlert, progressValue: 37)

            ScrollView {
                VStack {
                    starRatingSection

                    lengthResidence

                    merit

                    weakness

                    Spacer()

                    nextButton
                }
            }
            .modifier(AskDismissAlertModifier(
                isShowFullCover: $isShowFullCover,
                isShowAlert: $isShowDismissAlert,
                alertType: .hometerview))
            .padding(.top, 50)
        }
        .navigationBarHidden(true)
        .modifier(
            ListPopupModifier(
                selectedIndex: $selectedListIndex,
                isShowing: $isShowLengthResidenceList,
                listContents: viewModel.lengthResidenceTitles ))
    }

    var nextButton: some View {
        NavigationLink {
            StepEnterCompanyView(isShowFullCover: $isShowFullCover)
        } label: {
            Text("다음")
                .foregroundColor(.white)
                .font(.pretendard(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(!isEnableNextButton ? Color.colorStyle(.gray200) : Color.colorStyle(.blue300))
                .disabled(!isEnableNextButton)
                .cornerRadius(8)
                .padding(.horizontal)
        }
    }

    var merit: some View {
        VStack {
            HStack(spacing: 2) {
                Text("장점")
                    .font(.pretendard(size: 14))
                    .foregroundColor(.colorStyle(.gray800))

                Text("(최소 30자)")
                    .font(.pretendard(size: 12))
                    .foregroundColor(.colorStyle(.gray600))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom)

            ZStack(alignment: .topLeading) {
                TextEditor(text: $meritContents)
                    .frame(height: 76)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 12)
                    .font(.pretendard(size: 14))
                    .foregroundColor(.colorStyle(.gray900))
                    .overlay(
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.init(hex: "D4DBEB"))
                                .frame(height: 104)
                                .background(Color.colorStyle(.blueGrey100))
                                .allowsHitTesting(false)

                            Text(meritContents == "" ? "예) 집 위치, 집주인 방음 등" : meritContents)
                                .frame(height: 76, alignment: .topLeading)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 16)
                                .font(.pretendard(size: 14))
                                .foregroundColor(meritContents == "" ? Color.colorStyle(.gray400) : Color.colorStyle(.gray900))
                                .allowsHitTesting(false)
                        }
                    )
            }

            Text("\(meritContents.count) / 900")
                .foregroundColor(.colorStyle(.gray600))
                .font(.pretendard(size: 12))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }

    var weakness: some View {
        VStack {
            HStack(spacing: 2) {
                Text("단점")
                    .font(.pretendard(size: 14))
                    .foregroundColor(.colorStyle(.gray800))

                Text("(최소 30자)")
                    .font(.pretendard(size: 12))
                    .foregroundColor(.colorStyle(.gray600))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom)

            ZStack(alignment: .topLeading) {
                TextEditor(text: $weaknessContents)
                    .frame(height: 76)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 12)
                    .font(.pretendard(size: 14))
                    .foregroundColor(.colorStyle(.gray900))
                    .overlay(
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.init(hex: "D4DBEB"))
                                .frame(height: 104)
                                .background(Color.colorStyle(.blueGrey100))
                                .allowsHitTesting(false)

                            Text(weaknessContents == "" ? "예) 집 위치, 집주인 방음 등" : weaknessContents)
                                .frame(height: 76, alignment: .topLeading)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 16)
                                .font(.pretendard(size: 14))
                                .foregroundColor(weaknessContents == "" ? Color.colorStyle(.gray400) : Color.colorStyle(.gray900))
                                .allowsHitTesting(false)
                        }
                    )
            }

            Text("\(weaknessContents.count) / 900")
                .foregroundColor(.colorStyle(.gray600))
                .font(.pretendard(size: 12))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }

    var lengthResidence: some View {
        VStack {
            Text("거주기간")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendard(size: 14))
                .foregroundColor(.colorStyle(.gray800))
                .padding(.bottom)

            ZStack {
                HStack {
                    Text(selectedLengthResidenceTitle ?? "거주기간을 선택해주세요")
                        .font(.pretendard(size: 14))
                        .foregroundColor(selectedLengthResidenceTitle == nil ? .colorStyle(.gray400) : .colorStyle(.gray900))
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
                isShowLengthResidenceList = true
            }
            .onChange(of: selectedListIndex) { newValue in
                if let index = newValue {
                    selectedLengthResidenceTitle =  viewModel.assignLengthResidenceTitle(index: index)
                }
            }
        }
        .padding()
    }

    var starRatingSection: some View {
        VStack {
            Text("별점주기")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendard(size: 14))
                .foregroundColor(.colorStyle(.gray800))
                .padding(.bottom)
                .padding(.top, 24)

            Text(assignRateStarTitle(starCount: starCount))
                .font(.pretendard(size: 14))
                .foregroundColor(.colorStyle(.gray600))

            HStack(spacing: 0) {
                ForEach(1...RateStarModel.maxStarCount, id: \.self) { starIndex in
                    Image("icon_star")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(starIndex <= starCount ? .colorStyle(.blue300) : .colorStyle(.gray200))
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            starCount = assignStarCount(starIndex)
                        }
                }
            }
        }
        .padding()
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

    func assignStarCount(_ count: Int) -> Int {
        return starCount == count ? 0 : count
    }

    func assignRateStarTitle(starCount: Int) -> String {
        if let rateStarTitleModel = RateStarTitleModel(rawValue: starCount) {
            return rateStarTitleModel.description
        } else {
            return "별점을 입력해주세요"
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(viewModel: HometerviewViewModel(), isShowFullCover: .constant(true))
    }
}
