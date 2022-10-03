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
    @Binding var isShowFullCover: Bool
    @Namespace private var searchBarNamespace

    var body: some View {
        NavigationView {
            ZStack {
                Color.colorStyle(.blueGrey100)
                    .ignoresSafeArea()
                
                Group {
                    if isTapFakeSearchBar {
                        EnterCompanySearchView(isTapFakeSearchBar: $isTapFakeSearchBar, isShowFullCover: $isShowFullCover, searchBarNamespace: searchBarNamespace)
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
            .navigationBarItems(trailing: SimpleCancelButton(isActive: $isShowFullCover))
        }
    }
}

struct EnterCompanyInfo_Previews: PreviewProvider {
    static var previews: some View {
        EnterCompanyInfoView(isShowFullCover: .constant(true))
    }
}
