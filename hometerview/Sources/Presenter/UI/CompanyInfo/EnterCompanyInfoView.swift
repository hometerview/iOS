//
//  EnterCompanyInfo.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct EnterCompanyInfoView: View {
    @State private var selectedTextField = false
    @State private var isTapFakeSearchBar = false
    @Namespace private var searchBarNamespace

    var body: some View {

        NavigationView {
            ZStack {
                Color.colorStyle(.blueGrey100)
                    .ignoresSafeArea()
                
                Group {
                    if isTapFakeSearchBar {
                        EnterCompanySearchView(isTapFakeSearchBar: $isTapFakeSearchBar, searchBarNamespace: searchBarNamespace)
                    } else {
                        FakeEnterCompanySearchView(
                            isTapFakeSearchBar: $isTapFakeSearchBar,
                            searchBarNamespace: searchBarNamespace,
                            hasCompanyData: false
                        )
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: cancelButton)
        }
    }

    var cancelButton: some View {
        Button {

        } label: {
            Text("취소")
                .foregroundColor(.black)
        }

    }
}

struct EnterCompanyInfo_Previews: PreviewProvider {
    static var previews: some View {
        EnterCompanyInfoView()
    }
}
