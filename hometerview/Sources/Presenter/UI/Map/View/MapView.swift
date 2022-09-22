//
//  MapView.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/28.
//

import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var searchText: String = ""

    var body: some View {
        ZStack {
            KakaoMapView()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                mapSearchBar
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.init(hex: "D4DBEB"))
                            .frame(height: 50)
                    )
                    .padding(.leading, 14)
                    .padding(.trailing, 14)
                Spacer()
            }
        }.onAppear {
            print("permission alert")
        }
    }
    
    var mapSearchBar: some View {
        ZStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.init(hex: "#4754F0"))
                TextField("지하철 역이나 건물명 검색하기", text: $searchText)
                    .introspectTextField { textField in
                        textField.becomeFirstResponder()
                    }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        }
        .foregroundColor(.gray)
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
        addPinIcon(mapView: uiView)
        moveWithZoomLevel(mapView: uiView)

    }

    func moveWithZoomLevel(mapView: MTMapView) {
        mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude: 37.500723072486, longitude: 127.03680544372)), animated: true)
        mapView.setZoomLevel(4, animated: true)
    }

    func addPinIcon(mapView: MTMapView) {
        let item = MTMapPOIItem()
        item.itemName = "역삼역"
        item.markerType = .customImage
        item.customImageName = "icon_pin.png"
        item.customCalloutBalloonView = UIView()

        item.markerSelectedType = .none

        item.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo.init(latitude: 37.500723072486, longitude: 127.03680544372))
        item.customImageAnchorPointOffset = MTMapImageOffset(offsetX: 30, offsetY: 0)

        mapView.addPOIItems([item])
    }

    class Coordinator: NSObject, MTMapViewDelegate {
        var parent: KakaoMapView

        init(_ parent: KakaoMapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MTMapView!, finishedMapMoveAnimation mapCenterPoint: MTMapPoint!) {
            // 지도 이동이 끝났을 때
        }

        func mapView(_ mapView: MTMapView!, zoomLevelChangedTo zoomLevel: MTMapZoomLevel) {
            // 확대/축소 레벨이 변경됐을 때
        }

        func mapView(_ mapView: MTMapView!, selectedPOIItem poiItem: MTMapPOIItem!) -> Bool {
            // 아이템 선택 시
            return true
        }
    }

    typealias UIViewType = MTMapView
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
