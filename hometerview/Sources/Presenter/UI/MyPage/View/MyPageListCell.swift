//
//  MyPageListCell.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/13.
//

import SwiftUI

struct MyPageListCell: View {
    var body: some View {
        HStack {
            Text("내가 작성한 집터뷰")
                .font(.pretendard(size: 14, weight: .regular))
                .foregroundColor(.black)
        }
    }
}

struct MyPageListCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPageListCell()
    }
}
