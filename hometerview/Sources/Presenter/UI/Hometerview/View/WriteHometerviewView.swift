//
//  EnterCompanyInfo.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct WriteHometerviewView: View {
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
                        DirectInputSearchView(isTapFakeSearchBar: $isTapFakeSearchBar, searchBarNamespace: searchBarNamespace)
                    } else {
                        FakeDirectInputSearchView(
                            isTapFakeSearchBar: $isTapFakeSearchBar, isShowHeader: false,
                            searchBarNamespace: searchBarNamespace
                        )
                    }
                }
            }
            .navigationBarItems(trailing: SimpleCancelButton(isActive: $isShowFullCover))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("집터뷰 작성")
        }

    }
}

struct WriteHometerviewView_Previews: PreviewProvider {
    static var previews: some View {
        WriteHometerviewView(isShowFullCover: .constant(true))
    }
}
