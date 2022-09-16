//
//  KakaoLoginView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/07/27.
//

import SwiftUI

struct KakaoLoginView: View {
    var body: some View {
        Button {

            
        } label : {
            Image("kakao")
                .padding(.leading, 14)
            Text("카카오로 시작하기")
                .font(.pretendard(size: 14, weight: .semibold))
                .foregroundColor(.init(hex: "#191919"))
                .padding()
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.init(hex: "#FAE64C"))
    }
}

struct KakaoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        KakaoLoginView()
    }
}
