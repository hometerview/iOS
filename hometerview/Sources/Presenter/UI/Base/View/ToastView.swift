//
//  ToastView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import SwiftUI

struct ToastView: View {
    @Binding var isShow: Bool
    @Binding var toastString: String

    var body: some View {
        Text(toastString)
            .foregroundColor(.white)
            .font(.pretendard(size: 14, weight: .semibold))
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: 67, alignment: .leading)
            .background(Color.colorStyle(.blue300))
            .cornerRadius(8)
            .padding(.horizontal, 14)
            .padding(.top, 7)
    }
}

struct ToastModifier: ViewModifier {
    @Binding var isShow: Bool
    @Binding var toastString: String

    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content

            VStack {
                ToastView(isShow: $isShow, toastString: $toastString)
                    .offset(x: 0, y: isShow ? 0 : -150)

                Spacer()
            }
        }
        .onChange(of: isShow) { newValue in
            if isShow {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isShow = false
                }
            }
        }
        .animation(.easeInOut, value: isShow)
        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
            .modifier(ToastModifier(isShow: .constant(true), toastString: .constant("Hello World!")))
    }
}
