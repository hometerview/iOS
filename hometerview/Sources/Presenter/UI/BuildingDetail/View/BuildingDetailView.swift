//
//  DetailView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/06.
//

import SwiftUI

struct BuildingDetailView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                mapSection

                infoSection

                CustomDivider(color: .colorStyle(.gray100), height: 17)
                    .padding(.vertical)

                totalReviewInfo

                Divider()
                    .padding()

                ForEach(0...10, id: \.self) { index in
                    DetailListCell()
                        .padding(.horizontal)

                    Divider()
                        .padding()
                }
            }
            .navigationBarHidden(true)
        }
        .ignoresSafeArea()
    }

    var mapSection: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(.blue)

            BackButton()
                .padding(.top, 48)
                .padding(.leading, 10)
        }
        .frame(height: 180)

    }

    var infoSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("아크로텔 오피스텔")
                    .font(.pretendard(size: 24, weight:.bold))
                Spacer()
                Image("icon_heart")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.colorStyle(.gray200))
            }


            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image("icon_discovery")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.colorStyle(.gray400))

                    VStack(alignment: .leading) {
                        Text("인천 남동구 구월남로 125")
                            .font(.pretendard(size: 14))
                        Text("지번: 구월동 1133-4")
                            .font(.pretendard(size: 12))
                            .foregroundColor(.colorStyle(.gray500))
                    }
                }



                HStack {
                    Image("icon_home")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.colorStyle(.gray400))
                    Text("오피스텔")
                        .font(.pretendard(size: 14))
                }
            }
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("매매가")
                        .font(.pretendard(size: 12))
                        .foregroundColor(.colorStyle(.gray800))
                    Text("4억 5,500 ~ 5억 8,000")
                        .font(.pretendard(size: 12, weight: .semibold))
                        .foregroundColor(.colorStyle(.gray800))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                Spacer()

                VStack(alignment: .leading, spacing: 8) {
                    Text("전세가")
                        .font(.pretendard(size: 12))
                        .foregroundColor(.colorStyle(.gray800))
                    Text("4억 5,500 ~ 5억 8,000")
                        .font(.pretendard(size: 12, weight: .semibold))
                        .foregroundColor(.colorStyle(.gray800))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Spacer()
            }
            .frame(maxWidth: .infinity, minHeight: 70)
            .background(Color.colorStyle(.gray100))
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                Text("대중교통으로 7시에 출발할 경우")
                    .font(.pretendard(size: 14, weight: .regular))
                Text("삼성전자까지 약 1시 30분 거리입니다")
                    .font(.pretendard(size: 16, weight: .semibold))
            }
            .foregroundColor(.colorStyle(.blue300))
            .frame(maxWidth: .infinity, minHeight: 75, alignment: .leading)
            .padding(.horizontal)
            .background(Color.colorStyle(.blue100))
            .cornerRadius(4)
        }
        .padding(.horizontal)
    }

    var totalReviewInfo: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("icon_3user")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.colorStyle(.gray400))

                Text("2개의 리뷰")
                    .font(.pretendard(size: 14))
                    .foregroundColor(.colorStyle(.gray600))



            }

            HStack(alignment: .center) {
                TotalStarred(count: 4, width: 28)

                Text("4.0점")
                    .font(.pretendard(size: 24, weight: .medium))
                    .foregroundColor(.colorStyle(.blue300))
            }
        }
        .padding(.horizontal)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingDetailView()
    }
}
