//
//  BackButton.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/16.
//

import SwiftUI

struct BackButton: View {
    @SwiftUI.Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button {
             presentationMode.wrappedValue.dismiss()
        } label: {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)

                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.colorStyle(.gray800))
            }


        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()

            BackButton()
        }
    }
}
