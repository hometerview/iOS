//
//  AskDismissAlertModifier.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/17.
//

import SwiftUI

struct AskDismissAlertModifier: ViewModifier {
    @Binding var isShowFullCover: Bool
    @Binding var isShowAlert: Bool

    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text("직장 입력을 그만두시겠어요?"),
                      message: Text("입력한 정보는 저장되지 않습니다."),
                      primaryButton: .cancel(Text("계속")),
                      secondaryButton: .destructive(Text("네, 그만할께요"), action: {
                    isShowFullCover = false
                }))
            }
    }
}
