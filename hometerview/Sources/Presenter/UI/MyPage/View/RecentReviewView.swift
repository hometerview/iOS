//
//  RecentReviewView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/09/24.
//

import SwiftUI

struct RecentReviewView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("확인한 집터뷰가 없어요")
                .font(.pretendard(size: 14, weight: .regular))
                .foregroundColor(Color.colorStyle(.gray600))

            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 17)
                    .frame(width: 121, height: 34)
                    .foregroundColor(Color.colorStyle(.blue300))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .overlay(
                        Text("집터뷰 작성하기")
                            .font(.pretendard(size: 14, weight: .medium))
                            .foregroundColor(.white)
                    )
            }
        }
    }
}

struct RecentReviewView_Previews: PreviewProvider {
    static var previews: some View {
        RecentReviewView()
    }
}
