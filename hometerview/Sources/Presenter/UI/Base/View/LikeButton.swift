//
//  LikeButton.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/06.
//

import SwiftUI

struct LikeButton: View {
    let isLike: Bool

    var body: some View {
        HStack(spacing: 4) {
            Image("icon_heart")
                .resizable()
                .renderingMode(.template)
                .if(isLike, transform: { image in
                    image
                        .foregroundColor(.colorStyle(.red500))
                }).if(!isLike, transform: { image in
                        image
                            .foregroundColor(.colorStyle(.gray200))
                    })
                .frame(width: 14, height: 14)
            Text("찜하기")
                .font(.pretendard(size: 12))
                .foregroundColor(.colorStyle(.gray800))
        }
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.colorStyle(.gray200))
        )

    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(isLike: false)
            .previewLayout(.sizeThatFits)
    }
}
