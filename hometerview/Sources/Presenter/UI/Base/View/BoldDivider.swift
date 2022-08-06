//
//  BoldDivider.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/06.
//

import SwiftUI

struct BoldDivider: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.colorStyle(.gray100))
            .frame(maxWidth: .infinity, minHeight: 17)
    }
}

struct BoldDivider_Previews: PreviewProvider {
    static var previews: some View {
        BoldDivider()
            .previewLayout(.sizeThatFits)
    }
}
