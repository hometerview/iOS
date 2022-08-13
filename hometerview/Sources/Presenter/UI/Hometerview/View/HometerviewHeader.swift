//
//  HometerviewHeader.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import SwiftUI

struct HometerviewHeader: View {
    @Binding var isShowFullCover: Bool
    let progressValue: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            ProgressView(value: progressValue, total: 100)

            ZStack {

                Text("집터뷰 작성")
                    .font(.pretendard(size: 15, weight: .medium))

                HStack {
                    Spacer()

                    SimpleCancelButton(isActive: $isShowFullCover)
                }
            }
            .padding()

            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundColor(.colorStyle(.gray200))
        }
    }
}
