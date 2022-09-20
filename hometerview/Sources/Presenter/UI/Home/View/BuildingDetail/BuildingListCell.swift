//
//  BuildingListCell.swift
//  hometerview
//
//  Created by 김혜리 on 2022/09/21.
//

import SwiftUI

struct BuildingListCell: View {
    var hasHelpfulButton: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading ,spacing: 8) {
                Text("아크로텔 오피스텔")
                    .foregroundColor(.colorStyle(.gray900))
                    .font(.pretendard(size: 18, weight: .bold))

                HStack {
                    TotalStarred(count: 4, width: 16)
                    Text("4.0")
                        .foregroundColor(.colorStyle(.blue300))
                        .font(.pretendard(size: 12, weight: .semibold))
                    Text("|")
                        .foregroundColor(.colorStyle(.gray600))
                        .font(.pretendard(size: 12))
                    Text("2개의 리뷰")
                        .foregroundColor(.colorStyle(.gray600))
                        .font(.pretendard(size: 12))
                }
            }
            
            HStack {
                if hasHelpfulButton {
                    HelpfulButton(isHelpful: true)
                }
                
                LikeButton(isLike: true)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text("인천 남동구 구월남로 125")
                    Text("|")
                    Text("오피스텔")
                }
                .foregroundColor(.colorStyle(.gray600))
                .font(.pretendard(size: 12))
            }
        }
        .padding(.leading, 14)
        .padding(.trailing, 14)
    }
}

struct BuildingListCell_Previews: PreviewProvider {
    static var previews: some View {
        BuildingListCell()
    }
}
