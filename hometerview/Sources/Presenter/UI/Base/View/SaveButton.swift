//
//  SaveButton.swift
//  hometerview
//
//  Created by 김혜리 on 2022/09/24.
//

import SwiftUI

struct SaveButton: View {
    let isSaved: Bool

    var body: some View {
        HStack(spacing: 4) {
            Image("save")
                .resizable()
                .renderingMode(.template)
                .if(isSaved, transform: { image in
                    image
                        .foregroundColor(.colorStyle(.blue300))
                }).if(!isSaved, transform: { image in
                    image
                        .foregroundColor(.colorStyle(.gray200))
                })
                    .frame(width: 8, height: 10)
                    
                    Text("저장하기")
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

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(isSaved: false)
    }
}
