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

    var body: some View {
        NavigationView {
            List {
                header

                Section {
                    ForEach(0..<2, id: \..self) { _ in
                        HomeListCell()
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
            VStack(alignment: .leading) {
                Spacer()

                Text("삼성전자")
                    .font(.pretendard(weight: .bold, size: 24))
                    .padding(.bottom, 8)

                Text("통근러에게 추천하는 동네")
                    .font(.pretendard(weight: .medium, size: 24))
                    .padding(.bottom, 8)

                Text("동탄역 직장인들이 많이 사는 동네의 리뷰입니다")
                    .font(.pretendard(size: 14))
                    .padding(.bottom, 32)
            }
            .foregroundColor(.white)
            .frame(height: 201)
        }
        .listRowBackground(Color.colorStyle(.blue300))
    }

    var stickyHeader: some View {
        HStack {
            Text("강남구")
                .font(.pretendard(size: 14))
                .padding(.leading)

            Text("서초구")
                .font(.pretendard(size: 14))
                .padding(.leading)

            Text("중구")
                .font(.pretendard(size: 14))
                .padding(.leading)

            Spacer()
        }
        .frame(height: 50)
        .background(Color.gray)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
