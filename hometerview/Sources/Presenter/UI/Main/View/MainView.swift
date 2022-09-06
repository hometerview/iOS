//
//  ContentView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/09.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            Spacer()

            TabView(selection: $selectedIndex) {
                VStack {
                    Image("companyyy")
                        .frame(width: 240, height: 184)

                    Text("나랑 같은 지역으로 출근하는 사람들은\n어디에 살고있을까?")
                        .font(.pretendard(size: 20))
                        .multilineTextAlignment(.center)
                }
                .tag(0)

                VStack {
                    Image("map")
                        .frame(width: 226, height: 190)

                    Text("직장 정보만 입력하면\n살만한 동네를 추천해드려요!")
                        .font(.pretendard(size: 20))
                        .multilineTextAlignment(.center)

                }
                .tag(1)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 405)

            Spacer()

            VStack {
                KakaoLoginView()
                    .frame(width: 347, height: 50)
                AppleLoginView()
                    .frame(width: 347, height: 50)

                Button {
                    User.shared.status = .guest
                } label: {
                    Text("건너뛰기")
                        .frame(width: 347, height: 50)
                }
            }
            .padding(.bottom, 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
