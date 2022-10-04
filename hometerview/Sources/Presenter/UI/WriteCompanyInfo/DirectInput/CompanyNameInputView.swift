//
//  DirectInputAddressView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct CompanyNameInputView: View {
    @State private var companyNameText: String = ""
    @Binding var isShowFullCover: Bool

    var body: some View {
        ZStack {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 10) {
                Text("회사 주소")
                    .font(.pretendard(size: 14, weight: .medium))

                Text("서울시 마포구 문화로 32-3길 휘경상가")
                    .font(.pretendard(size: 14, weight: .medium))
                    .padding(.bottom, 50)

                Text("회사명")
                    .font(.pretendard(size: 14, weight: .medium))

                ZStack {
                    HStack {
                        TextField("회사명을 입력하세요", text: $companyNameText)
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

                Spacer()

                Button {
                    Log.info("직장 입력 완료")
                } label: {
                    Text("완료")
                        .foregroundColor(.white)
                        .font(.pretendard(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(companyNameText == "" ? Color.colorStyle(.gray200) : Color.colorStyle(.blue300))
                        .disabled(true)
                        .cornerRadius(8)

                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 48)

        }
        .padding()
        .navigationBarItems(trailing: SimpleCancelButton(isActive: $isShowFullCover))
    }
}

struct DirectInputAddressView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyNameInputView(isShowFullCover: .constant(true))
    }
}
