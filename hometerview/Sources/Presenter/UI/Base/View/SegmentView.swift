//
//  SegmentView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/02.
//

import SwiftUI

struct SegmentView: View {
    @Binding var selectedIndex: Int
    let titles: [String]
    let height: CGFloat = 50

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Capsule()
                    .foregroundColor(.colorStyle(.blueGrey200))
                HStack {
                    Capsule().foregroundColor(.white)
                        .frame(width: proxy.size.width / CGFloat(titles.count))
                        .padding(6)
                        .offset(x: culcurateSelectedCellOffsetX(proxy: proxy))
                }

                HStack(spacing: 0) {
                    ForEach(titles, id: \.self) { title in
                        Button {
                            withAnimation(.spring()) {
                                selectedIndex = findSelectedIndex(title: title)
                            }
                        } label: {
                            Text(title)
                                .foregroundColor(.colorStyle(findSelectedIndex(title: title) == selectedIndex ? .gray900 : .gray600))
                                .font(.system(size: 16, weight: .bold))
                                .frame(width: proxy.size.width / CGFloat(titles.count), height: proxy.size.height)
                        }

                        .fixedSize()
                    }
                }
                .frame(height: height)
            }
        }
        .frame(height: height)
    }

    private func culcurateSelectedCellOffsetX(proxy: GeometryProxy) -> CGFloat {
        return CGFloat(selectedIndex) * (proxy.size.width / CGFloat(titles.count)) - (6 * CGFloat(selectedIndex))
    }

    private func findSelectedIndex(title: String) -> Int {
        return titles.firstIndex(of: title) ?? 0
    }
}


struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(selectedIndex: .constant(1), titles: ["1", "2", "3"])
            .previewLayout(.sizeThatFits)
    }
}
