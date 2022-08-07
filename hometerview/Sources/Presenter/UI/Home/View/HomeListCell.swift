//
//  SwiftUIView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct HomeListCell: View {
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                TotalStarred(count: 4, width: 16)

                HStack(spacing: 4) {
                    Text("내 집이 최고")
                    Image(systemName: "circle.fill")
                        .font(.system(size: 2))
                    Text("3년 전 거주")
                    Image(systemName: "circle.fill")
                        .font(.system(size: 2))
                    Text("역삼역 통근")
                }
                .foregroundColor(.colorStyle(.gray600))
                .font(.pretendard(size: 12))

            }
            .font(.pretendard(size: 12))


            VStack(alignment: .leading, spacing: 6) {
                Text("장점")
                    .font(.pretendard(size: 12, weight: .medium))
                .foregroundColor(.colorStyle(.blue300))

                Text("역근처라 그런지 일단 인프라가 너무 좋아요!")
                    .font(.pretendard(size: 14, weight: .regular))
                    .foregroundColor(.black)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text("단점")
                    .font(.pretendard(size: 12, weight: .medium))
                    .foregroundColor(.colorStyle(.red500))
                Text("창문이 많아서 냉난방비 많이나오고 커튼달기도 쉽지 않음...")
                    .font(.pretendard(size: 14, weight: .regular))
                    .foregroundColor(.black)
            }


            VStack(alignment: .leading) {
                HStack {
                    HStack(spacing: 4) {
                        Image("icon_discovery")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.colorStyle(.gray400))
                            .frame(width: 16, height: 16)
                        Text("아크로텔 오피스텔")
                            .font(.pretendard(size: 14))
                            .foregroundColor(.colorStyle(.gray600))
                    }

                    HStack(spacing: 4) {
                        Image("icon_home")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.colorStyle(.gray400))
                            .frame(width: 16, height: 16)
                        Text("오피스텔")
                            .font(.pretendard(size: 14))
                            .foregroundColor(.colorStyle(.gray600))
                    }
                }
            }

        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.colorStyle(.gray200), lineWidth: 1)
        )
        .background(Color.white)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListCell()
            .previewLayout(.sizeThatFits)
    }
}
