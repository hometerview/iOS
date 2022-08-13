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

                ProgressView(value: 37, total: 100)

                VStack {
                    header

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

                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }

    var header: some View {
        ZStack {
            Text("집터뷰 작성")
                .font(.pretendard(size: 15, weight: .medium))

            HStack {
                Spacer()

                SimpleCancelButton(isActive: $isShowFullCover)
            }
        }
        .padding()
    }
}

struct WriteHometerviewView_Previews: PreviewProvider {
    static var previews: some View {
        WriteHometerviewView(isShowFullCover: .constant(true))
    }
}
