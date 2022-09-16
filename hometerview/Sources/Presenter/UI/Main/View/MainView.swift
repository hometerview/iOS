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
                VStack(spacing: 12) {
                    Image("onboarding1")
                        .frame(width: 240, height: 200)

                    Text("같은 지역으로 출근하는 사람들은\n어디에 살고있을까?")
                        .font(.pretendard(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .tag(0)

                VStack(spacing: 12) {
                    Image("onboarding2")
                        .frame(width: 226, height: 200)

                    Text("직장 정보를 입력하면\n동네를 추천해드려요!")
                        .font(.pretendard(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .tag(1)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 405)

            Spacer()

            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    KakaoLoginView()
                        .cornerRadius(8)
                        .frame(width: 347, height: 50)
                    AppleLoginView()
                        .cornerRadius(8)
                        .frame(width: 347, height: 50)
                    Button {
                        
                        User.shared.status = .guest
                    } label: {
                        Text("건너뛰기")
                            .font(.pretendard(size: 14, weight: .regular))
                            .foregroundColor(.colorStyle(.gray400))
                    }
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
