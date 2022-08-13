//
//  NicknameEditView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/14.
//

import SwiftUI

struct NicknameEditView: View {
    @State private var nickname: String = ""

    var body: some View {
        VStack {
            VStack(spacing: 8) {
                ZStack {
                    HStack {
                        TextField("이름을 입력하세요", text: $nickname)
                            .introspectTextField { textField in
                                textField.becomeFirstResponder()
                            }
                    }
                    .padding()
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.init(hex: "D4DBEB"))
                            .frame(height: 50)
                    )
                }
                .padding(.horizontal, 14)
                Text("0/10 자")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.pretendard(size: 12, weight: .regular))
                    .foregroundColor(.colorStyle(.gray400))
                    .padding(.trailing, 14)
            }
            Spacer()
            Button {
                hideKeyboard()
            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.colorStyle(.blue300))
                    .padding(.all, 14)
                    .overlay(
                        Text("저장하기")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    )
            }
        }
        .padding(.top, 24)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NicknameEditView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameEditView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
