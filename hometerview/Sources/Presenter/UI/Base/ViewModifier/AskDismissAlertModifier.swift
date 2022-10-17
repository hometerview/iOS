//
//  AskDismissAlertModifier.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/10/17.
//

import SwiftUI

enum AskDismissDescriptionType {
    case enterCompany
    case hometerview
}

extension AskDismissDescriptionType {
    var alertTitle: String {
        switch self {
            case .enterCompany:
                return "직장 입력을 그만두시겠어요?"
            case .hometerview:
                return "집터뷰 작성을 그만두시겠어요?"
        }
    }

    var alertMessage: String {
        switch self {
            case .enterCompany:
                return "입력한 정보는 저장되지 않습니다."
            case .hometerview:
                return "입력한 정보는 저장되지 않습니다."
        }
    }
}

struct AskDismissAlertModifier: ViewModifier {
    @Binding var isShowFullCover: Bool
    @Binding var isShowAlert: Bool
    let alertType: AskDismissDescriptionType

    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(alertType.alertTitle),
                      message: Text(alertType.alertMessage),
                      primaryButton: .cancel(Text("계속")),
                      secondaryButton: .destructive(Text("네, 그만할께요"), action: {
                    isShowFullCover = false
                }))
            }
    }
}
