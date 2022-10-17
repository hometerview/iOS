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
    var showBackButton: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            ProgressView(value: progressValue, total: 100)

            ZStack {
                HStack {
                    if showBackButton {
                        BackButton()
                            .padding(.leading, 14)
                    }

                    Spacer()
                }

                Text("집터뷰 작성")
                    .font(.pretendard(size: 15, weight: .medium))

                HStack {
                    Spacer()

                    SimpleCancelButton(isActive: $isShowFullCover)
                }
            }
            .padding()

            CustomDivider(color: .colorStyle(.gray200), height: 1)
        }
    }
}
