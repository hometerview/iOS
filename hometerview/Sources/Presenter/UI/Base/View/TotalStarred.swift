//
//  TotalStarred.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/06.
//

import SwiftUI

struct TotalStarred: View {
    let count: Int
    let width: CGFloat

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5, id: \.self) { starIndex in
                Image("icon_star")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(starIndex < count ? .colorStyle(.blue300) : .colorStyle(.gray200))
                    .frame(width: width, height: width)

            }
        }
    }
}

struct TotalStarred_Previews: PreviewProvider {
    static var previews: some View {
        TotalStarred(count: 4, width: 16)
            .previewLayout(.sizeThatFits)
    }
}
