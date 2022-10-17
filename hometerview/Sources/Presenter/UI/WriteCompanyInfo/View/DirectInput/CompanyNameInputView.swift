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
                CustomDivider(color: .colorStyle(.gray200), height: 1)

                Text("회사 주소")
                    .font(.pretendard(size: 14, weight: .medium))
                    .foregroundColor(.colorStyle(.gray600))
                    .padding(.horizontal)
                    .padding(.top, 24)

                Text("서울시 마포구 문화로 32-3길 휘경상가")
                    .font(.pretendard(size: 14, weight: .medium))
                    .padding(.bottom, 32)
                    .padding(.horizontal)

                Text("회사명")
                    .font(.pretendard(size: 14, weight: .medium))
                    .foregroundColor(.colorStyle(.gray600))
                    .padding(.horizontal)

                companyNameTextField

                Spacer()

                okButton
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 48)

        }
        .navigationTitle("회사 정보 입력")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(), trailing: SimpleCancelButton(isActive: $isShowFullCover))
    }

    var companyNameTextField: some View {
        ZStack {
            HStack {
                TextField("회사명을 입력해 주세요", text: $companyNameText)
                    .introspectTextField { textField in
                        textField.becomeFirstResponder()
                    }
            }
            .padding()
            .foregroundColor(companyNameText == "" ? Color.colorStyle(.gray400) : Color.colorStyle(.gray900))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.init(hex: "D4DBEB"))
                    .frame(height: 50)
            )
            .padding(.horizontal)
        }
    }

    var okButton: some View {
        Button {
            Log.info("직장 입력 완료")
        } label: {
            Text("완료")
                .foregroundColor(.white)
                .font(.pretendard(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(companyNameText == "" ? Color.colorStyle(.gray200) : Color.colorStyle(.blue300))
                .disabled(companyNameText == "")
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

struct DirectInputAddressView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyNameInputView(isShowFullCover: .constant(true))
    }
}
