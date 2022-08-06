//
//  HomeListCell.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/05.
//

import SwiftUI

struct HomeListCell: View {
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            Text("아크로텔 오피스텔")
                .font(.pretendard(size: 20, weight: .bold))


            VStack(alignment: .leading) {
                HStack {
                    Image("icon_discovery")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.colorStyle(.gray400))
                        .frame(width: 16, height: 16)
                    Text("인천 남동구 구월남로 125")
                        .font(.pretendard(size: 14))
                }

                HStack {
                    Image("icon_home")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.colorStyle(.gray400))
                        .frame(width: 16, height: 16)
                    Text("오피스텔")
                        .font(.pretendard(size: 14))
                }
            }

            HStack(alignment: .center) {
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
            }

            VStack(alignment: .leading, spacing: 6) {
                Text("단점")
                    .font(.pretendard(size: 12, weight: .medium))
                    .foregroundColor(.colorStyle(.red500))
                Text("창문이 많아서 냉난방비 많이나오고 커튼달기도 쉽지 않음...")
                    .font(.pretendard(size: 14, weight: .regular))
            }

            LikeButton(isLike: true)

        }
    }
}

struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeListCell()
            .previewLayout(.sizeThatFits)
    }
}
