//
//  NicknameEditView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/14.
//

import SwiftUI

struct NicknameEditView: View {
    @State var nickname: String = ""

    var body: some View {
        VStack {
            TextField("김길동", text: $nickname)
                .frame(height: 50)
                .padding(.horizontal, 14)
                .textFieldStyle(.roundedBorder)
            Text("0/10 자")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.pretendard(size: 12, weight: .regular))
                .foregroundColor(.colorStyle(.gray400))
                .padding(.trailing, 14)
            Spacer()
        }
        Button {
            print("저장하기 누름")
        } label: {
            Text("저장하기")
                .font(.pretendard(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50, alignment: .center)
        .padding(.all, 14)
        .background(Color.colorStyle(.blue300))
    }
}

struct NicknameEditView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameEditView()
    }
}
