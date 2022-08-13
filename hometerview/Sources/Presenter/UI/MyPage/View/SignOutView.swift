//
//  SignOutView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/14.
//

import SwiftUI

struct SignOutView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("로그아웃") {
            showingAlert.toggle()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("로그아웃 하시겠습니까?"), primaryButton: .destructive(Text("확인"), action: {
                print("확인 눌렀음")
            }), secondaryButton: .cancel(Text("취소")))
        }
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
