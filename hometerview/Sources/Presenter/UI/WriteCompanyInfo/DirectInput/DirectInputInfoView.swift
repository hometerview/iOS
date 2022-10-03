//
//  DirectInputInfoView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct DirectInputInfoView: View {
    @State private var selectedTextField = false
    @State private var isTapFakeSearchBar = false
    @Binding var isShowFullCover: Bool
    @Namespace private var searchBarNamespace

    var body: some View {
        ZStack {
            Color.colorStyle(.blueGrey100)
                .ignoresSafeArea()

            Group {
                if isTapFakeSearchBar {
                    DirectInputSearchView(isTapFakeSearchBar: $isTapFakeSearchBar, searchBarNamespace: searchBarNamespace)
                } else {
                    FakeDirectInputSearchView(
                        isTapFakeSearchBar: $isTapFakeSearchBar,
                        searchBarNamespace: searchBarNamespace
                    )
                }
            }
        }
        .navigationBarItems(trailing: SimpleCancelButton(isActive: $isShowFullCover))
    }
}

struct DirectInputInfoViewPreview: PreviewProvider {
    static var previews: some View {
        DirectInputInfoView(isShowFullCover: .constant(true))
    }
}
