//
//  BoldDivider.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/06.
//

import SwiftUI

struct CustomDivider: View {
    let color: Color
    let height: CGFloat

    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(maxWidth: .infinity, maxHeight: height)
    }
}
