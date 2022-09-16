//
//  LoadingView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/09/17.
//

import SwiftUI

struct LoadingView: View {
    let station: String = "판교역"
    
    var body: some View {
        VStack(spacing: 73) {
            Spacer()
            HStack {
                Text("\(Text(station).foregroundColor(.colorStyle(.blue600))) 출근러들이\n사는 동네의 리뷰 가져오는 중!")
                    .multilineTextAlignment(.center)
                    .font(.pretendard(size: 24, weight: .bold))
                    .foregroundColor(.colorStyle(.gray800))
            }
            .padding(.horizontal, 52)
            Image("loading")
                .resizable()
                .ignoresSafeArea()
                .frame(maxHeight: 487)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
