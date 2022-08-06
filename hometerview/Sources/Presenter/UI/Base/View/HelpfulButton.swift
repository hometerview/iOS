//
//  HelpfulButton.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/06.
//

import SwiftUI

struct HelpfulButton: View {
    let isHelpful: Bool

    var body: some View {
        HStack(spacing: 4) {
            Image("icon_like")
                .resizable()
                .renderingMode(.template)
                .if(isHelpful, transform: { image in
                    image
                        .foregroundColor(.colorStyle(.blue300))
                }).if(!isHelpful, transform: { image in
                    image
                        .foregroundColor(.colorStyle(.gray200))
                })
                .frame(width: 14, height: 14)

                Text("도움이 돼요")
                .font(.pretendard(size: 12))
                .foregroundColor(.colorStyle(.gray800))

                Text("25")
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

struct HelpfulButton_Previews: PreviewProvider {
    static var previews: some View {
        HelpfulButton(isHelpful: true)
            .previewLayout(.sizeThatFits)
    }
}
