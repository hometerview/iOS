//
//  WishView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct WishView: View {
    @State private var selectedSegmentIndex: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                picker
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(0...10, id: \.self) { index in
                            NavigationLink {
                                BuildingDetailView()
                            } label: {
                                if selectedSegmentIndex == 0 {
                                    DetailListCell()
                                        .padding(.horizontal)
                                } else if selectedSegmentIndex == 1  {
                                    BuildingListCell()
                                        .padding(.horizontal)
                                }
                            }

                            Divider()
                                .padding()
                        }
                    }
                    .navigationBarHidden(true)
                }
                .ignoresSafeArea()
            }
        }
    }

    var picker: some View {
        SegmentView(selectedIndex: $selectedSegmentIndex, titles: PickerTabType.titles)
    }
}

struct WishView_Previews: PreviewProvider {
    static var previews: some View {
        WishView()
    }
}
