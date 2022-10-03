//
//  EnterCompanyInfo.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/07.
//

import SwiftUI

struct WriteHometerviewView: View {
    @StateObject private var viewModel = HometerviewViewModel()
    @State private var selectedTextField = false
    @State private var isTapFakeSearchBar = false
    @Binding var isShowFullCover: Bool
    @Namespace private var searchBarNamespace

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.colorStyle(.blueGrey100)
                    .ignoresSafeArea()

                VStack {
                    HometerviewHeader(isShowFullCover: $isShowFullCover, progressValue: 37, showBackButton: false)

                    Group {
                        if isTapFakeSearchBar {
                            WriteInputSearchView(
                                viewModel: viewModel,
                                isTapFakeSearchBar: $isTapFakeSearchBar,
                                isShowFullCover: $isShowFullCover,
                                searchBarNamespace: searchBarNamespace)
                        } else {
                            FakeDirectInputSearchView(
                                isTapFakeSearchBar: $isTapFakeSearchBar, isShowHeader: false,
                                searchBarNamespace: searchBarNamespace
                            )
                        }
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct WriteHometerviewView_Previews: PreviewProvider {
    static var previews: some View {
        WriteHometerviewView(isShowFullCover: .constant(true))
    }
}
