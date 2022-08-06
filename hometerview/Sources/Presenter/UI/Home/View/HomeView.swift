//
//  HomeView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

import Introspect

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var stickyHeaderSelectedIndex = 0
    @Namespace private var bottomLine

    var body: some View {
        NavigationView {
            List {
                header

                Section {
                    ForEach(0..<10, id: \..self) { _ in
                        VStack {
                            HomeListCell()
                            Divider()
                                .padding(.vertical)
                        }
                    }
                } header: {
                    stickyHeader
                }


                .listRowBackground(Color.white)


            }
            .listStyle(.plain)
            .ignoresSafeArea()
            .introspectTableView { tableView in
                tableView.separatorInset = .zero
                tableView.separatorColor = .clear
                tableView.contentInset = .zero
            }

            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    var header: some View {
        Section {
            ZStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Spacer()

                    Text("삼성전자")
                        .font(.pretendard(size: 24, weight: .bold))
                        .padding(.bottom, 8)

                    Text("통근러에게 추천하는 동네")
                        .font(.pretendard(size: 24, weight: .medium))
                        .padding(.bottom, 8)

                    Text("동탄역 직장인들이 많이 사는 동네의 리뷰입니다")
                        .font(.pretendard(size: 14))
                        .padding(.bottom, 32)
                }
                .foregroundColor(.white)
                .frame(height: 180)
            }
        }
        .listRowBackground(Color.colorStyle(.blue300))

    }

    var stickyHeader: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 16) {
                ForEach(0..<3, id: \.self) { index in
                    ZStack(alignment: .center) {
                        Button {
                            withAnimation(.spring()) {
                                stickyHeaderSelectedIndex = index
                            }
                        } label: {
                            Text("갱냄구")
                                .font(.pretendard(size: 14))
                                .foregroundColor(stickyHeaderSelectedIndex == index ? .black : .colorStyle(.gray500))
                        }

                        if stickyHeaderSelectedIndex == index {
                            VStack {
                                Spacer(minLength: 1)
                                Rectangle()
                                    .frame(height: 2)
                            }
                            .matchedGeometryEffect(id: "bottomLine", in: bottomLine)
                        }
                    }
                }
            }
        }
        .frame(height: 40)
        .foregroundColor(.black)
        .padding(.leading)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
