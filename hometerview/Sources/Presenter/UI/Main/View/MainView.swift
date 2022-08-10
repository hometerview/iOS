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
        Button {
            User.shared.status = .guest
        } label: {
            Text("건너뛰기")
        }
        
        VStack {
            TabView(selection: $selectedIndex) {
                VStack {
                    Text("나랑 같은 지역으로 출근하는 사람들은\n어디에 살고있을까?")
                        .font(.pretendard(size: 20))
                        .multilineTextAlignment(.center)

                    Image("image416")
                        .frame(width: 243, height: 228)
                }
                .tag(0)

                VStack {
                    Text("직장 정보만 입력하면\n살만한 동네를 추천해드려요!")
                        .font(.pretendard(size: 20))
                        .multilineTextAlignment(.center)

                    Image("image417")
                        .frame(width: 243, height: 228)
                }
                .tag(1)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 405)

            VStack {
                AppleLoginView()
                    .frame(width: 347, height: 50)
                KakaoLoginView()
                    .frame(width: 347, height: 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
