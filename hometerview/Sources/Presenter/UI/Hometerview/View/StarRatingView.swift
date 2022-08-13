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
    @State private var selectedListIndex: Int? = nil
    @State private var meritContents: String = ""
    @State private var weaknessContents: String = ""
    var isEnableNextButton: Bool {
        return meritContents.count > 30 &&
        weaknessContents.count > 30 &&
        selectedListIndex != nil &&
        viewModel.starCount != 0
    }

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack {
                    HometerviewHeader(isShowFullCover: $isShowFullCover, progressValue: 70)

                    starRatingSection

                    lengthResidence

                    merit

                    weakness

                    Spacer()

                    nextButton
                }
            }
        }
        .modifier(
            ListPopupModifier(
                selectedIndex: $selectedListIndex,
                isShowing: $isShowLengthResidenceList,
                listContents: viewModel.lengthResidenceTitles ))
        .onChange(of: selectedListIndex) { newValue in
            if let index = newValue {
                viewModel.assignLengthResidenceTitle(index: index)
            }
        }
    }

    var nextButton: some View {
        NavigationLink {

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
            Text("장점")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendard(size: 14))
                .foregroundColor(.colorStyle(.gray800))
                .padding(.bottom)

            ZStack(alignment: .topLeading) {
                TextEditor(text: $meritContents)
                    .frame(height: 76)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 12)
                    .font(.pretendard(size: 14))

                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.init(hex: "D4DBEB"))
                    .frame(height: 104)

                Text(meritContents.isEmpty ? "예) 집 위치, 집주인 방음 등" : "")
                    .frame(height: 76, alignment: .topLeading)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                    .font(.pretendard(size: 14))
                    .foregroundColor(.colorStyle(.gray400))
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
            Text("단점")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendard(size: 14))
                .foregroundColor(.colorStyle(.gray800))
                .padding(.bottom)

            ZStack(alignment: .topLeading) {
                TextEditor(text: $weaknessContents)
                    .frame(height: 76)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 12)
                    .font(.pretendard(size: 14))

                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.init(hex: "D4DBEB"))
                    .frame(height: 104)

                Text(weaknessContents == "" ? "예) 집 위치, 집주인 방음 등" : "")
                    .frame(height: 76, alignment: .topLeading)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                    .font(.pretendard(size: 14))
                    .foregroundColor(.colorStyle(.gray400))
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
                    Text(viewModel.selectedLengthResidenceTitle ?? "")
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
                .onTapGesture {
                    isShowLengthResidenceList = true
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

            Text(viewModel.rateStarTitle)
                .font(.pretendard(size: 14))
                .foregroundColor(.colorStyle(.gray600))

            HStack(spacing: 0) {
                ForEach(1...RateStarModel.starCount, id: \.self) { starIndex in
                    Image("icon_star")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(starIndex < viewModel.starCount ? .colorStyle(.blue300) : .colorStyle(.gray200))
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            viewModel.assignStarCount(starIndex: starIndex)
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
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(viewModel: HometerviewViewModel(), isShowFullCover: .constant(true))
    }
}
