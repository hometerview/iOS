//
//  MapView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        KakaoMapView()
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct KakaoMapView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MTMapView {
        let mapView = MTMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.baseMapType = .standard

        return mapView
    }

    func updateUIView(_ uiView: MTMapView, context: Context) {

    }

    class Coordinator: NSObject, MTMapViewDelegate {
        var parent: KakaoMapView

        init(_ parent: KakaoMapView) {
            self.parent = parent
        }
    }

    typealias UIViewType = MTMapView
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
