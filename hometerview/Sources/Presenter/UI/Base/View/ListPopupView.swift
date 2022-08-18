//
//  HalfPopupView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import SwiftUI

struct ListPopupView: View {
    @Binding var isShowing: Bool
    @Binding var selectedIndex: Int?
    let list: [String]

    var body: some View {
        LazyVStack(spacing: 0) {
            Rectangle()
                .foregroundColor(.colorStyle(.gray200))
                .cornerRadius(4)
                .frame(width: 40, height: 4)

            ForEach(list.indices, id: \.self) { index in
                Text(list[index])
                    .font(.pretendard(size: 14))
                    .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                    .padding(.leading, 14)
                    .onTapGesture {
                        selectedIndex = index
                        isShowing = false
                    }
            }

            Rectangle()
                .frame(height: 30)
                .foregroundColor(.clear)

        }
        .padding(.vertical, 8)
        .padding(.horizontal, 14)
        .background(Color.white)
        .cornerRadius(15, corners: .topLeft)
        .cornerRadius(15, corners: .topRight)
    }
}

struct ListPopupModifier: ViewModifier {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Binding var selectedIndex: Int?
    @Binding var isShowing: Bool
    let listContents: [String]

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content

            if isShowing {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .opacity(0.2)
                    .onTapGesture {
                        isShowing = false
                    }

                Rectangle()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: safeAreaInsets.bottom)
                    .foregroundColor(.white)

                ListPopupView(
                    isShowing: $isShowing,
                    selectedIndex: $selectedIndex,
                    list: listContents)
            }
        }
        .transition(AnyTransition.move(edge: .bottom))

    }
}

struct HalfPopupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorStyle(.blueGrey200)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .modifier(ListPopupModifier(selectedIndex: .constant(1), isShowing: .constant(true), listContents: ["A", "B", "C"]))
        }
    }
}
