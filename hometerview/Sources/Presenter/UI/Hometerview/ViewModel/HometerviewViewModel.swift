//
//  HometerviewViewModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import Foundation

class HometerviewViewModel: BaseViewModel,
                            ObservableObject {
    
    let livingFloorModelTitles: [String] = LivingFloorModel.allCases.map({ $0.description })
    let lengthResidenceTitles: [String] = LengthResidenceModel.popupListTitles

    // 거주층
    @Published var selectedLivingFloorTitle: String? = nil
    
    @Published var selectedLengthResidenceTitle: String? = nil
    @Published var meritContents: String = ""
    @Published var weaknessContents: String = ""

    @Published var starCount: Int = 0
    var rateStarTitle: String {
        if let rateStarTitleModel = RateStarTitleModel(rawValue: starCount) {
            return rateStarTitleModel.description
        } else {
            return "별점을 입력해주세요"
        }
    }
    
    func assignSelectedLivingFloorTitle(index: Int) {
        selectedLivingFloorTitle = LivingFloorModel.allCases[index].description
    }

    func assignLengthResidenceTitle(index: Int) {
        selectedLengthResidenceTitle = LengthResidenceModel.popupListTitles[index]
    }

    func assignStarCount(starIndex: Int) {
        let star = starIndex + 1

        if starCount == star {
            starCount = 0
        } else {
            starCount = starIndex + 1
        }
    }

}
