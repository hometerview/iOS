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
    @Namespace private var searchBarNamespace

    var body: some View {

        NavigationView {
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

struct DirectInputInfoViewPreview: PreviewProvider {
    static var previews: some View {
        DirectInputInfoView()
    }
}
