//
//  AddressGuidelineView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/17.
//

import SwiftUI

struct AddressGuidelineView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("TIP")
                .font(.pretendard(size: 14, weight: .semibold))
            Text("아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.")
                .padding(.bottom, 8)

            Text("도로명 + 건물번호")
            Text("예) 판교역로 235, 제주 첨단로 242")
                .foregroundColor(.colorStyle(.blue300))
                .padding(.bottom, 8)

            Text("지역명(동/리) + 번지")
            Text("예) 삼평동 681, 제주 영평동 2181")
                .foregroundColor(.colorStyle(.blue300))
                .padding(.bottom, 8)

            Text("지역명(동/리) + 건물명(아파트명)")
            Text("예) 분당 주공, 연수동 주공3차")
                .foregroundColor(.colorStyle(.blue300))
                .padding(.bottom, 8)

            Text("사서함명 + 번호")
            Text("예) 분당우체국사서함 1~100")
                .foregroundColor(.colorStyle(.blue300))
        }
        .font(.pretendard(size: 10))
        .foregroundColor(.colorStyle(.gray900))
    }
}
