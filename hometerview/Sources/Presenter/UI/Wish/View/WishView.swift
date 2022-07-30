//
//  WishView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct WishView: View {
    @StateObject private var viewModel = WishViewModel()
    
    var body: some View {
        Text("WishView")
    }
}

struct WishView_Previews: PreviewProvider {
    static var previews: some View {
        WishView()
    }
}
