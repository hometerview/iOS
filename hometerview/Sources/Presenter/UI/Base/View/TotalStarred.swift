//
//  TotalStarred.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/06.
//

import SwiftUI

struct TotalStarred: View {
    struct ClipShape: Shape {
        let width: Double

        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        }
    }

    let count: Float
    let width: CGFloat

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5, id: \.self) { _ in
                Image("icon_star")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: width, height: width)
                    .foregroundColor(.colorStyle(.gray200))
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<5, id: \.self) { _ in
                        Image("icon_star")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: width, height: width)
                            .foregroundColor(.colorStyle(.blue300))
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .clipShape(
                    ClipShape(width: (reader.size.width / CGFloat(5)) * CGFloat(count))
                )
            }
        )
    }
}

struct TotalStarred_Previews: PreviewProvider {
    static var previews: some View {
        TotalStarred(count: 4.421, width: 16)
            .previewLayout(.sizeThatFits)
    }
}
