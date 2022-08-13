//
//  SimpleCancelButton.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import SwiftUI

struct SimpleCancelButton: View {
    @Binding var isActive: Bool

    var body: some View {
        Button {
            isActive = false
        } label: {
            Text("취소")
                .foregroundColor(.colorStyle(.gray700))
                .font(.pretendard(size: 14))
        }
    }
}

struct SimpleCancelButton_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCancelButton(isActive: .constant(true))
    }
}
