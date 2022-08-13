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
    @State private var selectedRankIndex = 0
    @State private var isToastShow: Bool = false
    @State private var isShowSegmentedControl: Bool = false
    @State private var toastMessage: String = "HOHOHOHO"
    @Namespace private var bottomLine

    let headerHeight: CGFloat = 180
    let rankHeaderHeight: CGFloat = 80
    var fullHeaderHeight: CGFloat {
        return headerHeight + rankHeaderHeight
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.colorStyle(.blueGrey100)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        header

                        rankHeader

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
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                                               value: -$0.frame(in: .named("scroll")).origin.y)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) { scrollOffsetY in
                        withAnimation {
                            isShowSegmentedControl = scrollOffsetY > fullHeaderHeight
                        }
                    }
                }
                .coordinateSpace(name: "scroll")
                .padding(.top, 1)

                if isShowSegmentedControl {
                    Group {
                        Picker("", selection: $selectedRankIndex) {
                            ForEach(0..<3, id: \.self) { index in
                                Text("갱냄구")
                                    .tag(index)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                    }
                    .background(Color.colorStyle(.blueGrey100))
                    .animation(.easeInOut, value: isShowSegmentedControl)
                    .transition(.opacity)

                    VStack {
                        Spacer()

                        HStack {
                            Image("icon_map")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 18, height: 18)
                                .foregroundColor(.white)

                            Text("\("갱냄구") 지도보기")
                                .font(.pretendard(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 143, height: 34, alignment: .center)
                        .background(Color.colorStyle(.gray800))
                        .cornerRadius(17)



                    }
                    .animation(.easeInOut, value: isShowSegmentedControl)
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .padding(.bottom, 20)
                }

            }

            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
        .modifier(ToastModifier(isShow: $isToastShow, toastString: $toastMessage))
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
        .frame(height: headerHeight)
        .padding(.horizontal)
    }

    var rankHeader: some View {
        HStack {
            ForEach(0..<3, id: \.self) { index in
                Button {
                    selectedRankIndex = index
                } label: {
                    rankHeaderCell(index: index)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
        .frame(height: rankHeaderHeight)
    }

    @ViewBuilder func rankHeaderCell(index: Int) -> some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: .infinity, minHeight: 80)
                .foregroundColor(index == selectedRankIndex ? .colorStyle(.gray700) : .colorStyle(.blueGrey200))
                .overlay(
                    Text("갱냄구")
                        .font(.pretendard(size: 16, weight: .semibold))
                        .foregroundColor(index == selectedRankIndex ? .white : .colorStyle(.gray600))

                )

            if index == 0 {
                Image("badge")
                    .offset(x: 0, y: -10)
            }
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
