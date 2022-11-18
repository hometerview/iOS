//
//  HometerviewViewModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import Foundation

class HometerviewViewModel: BaseViewModel {
    
    let livingFloorModelTitles: [String] = LivingFloorModel.allCases.map({ $0.description })
    let lengthResidenceTitles: [String] = LengthResidenceModel.popupListTitles

    // 주소(추가 필요)
    
    // 거주층
    var selectedLivingFloorTitle: String? = nil
    // 거주기간
    var selectedLengthResidenceTitle: String? = nil
    // 장점
    var meritContents: String = ""
    // 단점
    var weaknessContents: String = ""

    @Published var starCount: Int = 0
    
    func assignSelectedLivingFloorTitle(index: Int) -> String {
        return LivingFloorModel.allCases[index].description
    }

    func assignLengthResidenceTitle(index: Int) -> String {
        return LengthResidenceModel.popupListTitles[index]
    }

//    func assignStarCount(_ count: Int) -> Int {
//        if starCount == count {
//            return 0
//        } else {
//            starCount = count
//        }
//    }
}
