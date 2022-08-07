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
            ZStack {
                Color.colorStyle(.blueGrey200)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        header

                        ForEach(0..<10, id: \..self) { _ in
                            LazyVStack {
                                NavigationLink {
                                    BuildingDetailView()
                                } label: {
                                    HomeListCell()
                                        .padding(.horizontal)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
            }

            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    var header: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("넥슨코리아")
                    .font(.jalnanOTF(size: 24))
                Image("icon_triangle")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.bottom, 4)
            .foregroundColor(.colorStyle(.blue300))

            Text("통근러에게 추천하는 동네")
                .font(.jalnanOTF(size: 24))
                .padding(.bottom, 8)

            Text("동탄역 직장인들이 많이 사는 동네의 리뷰입니다")
                .font(.pretendard(size: 14))
                .padding(.bottom, 32)
        }
        .padding(.vertical, 32)
        .padding(.horizontal)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
