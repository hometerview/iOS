//
//  HometerviewViewModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import Foundation

class HometerviewViewModel: BaseViewModel,
                            ObservableObject {
    
    let livingFloorModelTitle: [String] = LivingFloowModel.allCases.map({ $0.description })

    @Published var selectedLivingFloorTitle: String? = nil
    
    func assignSelectedLivingFloowTitle(index: Int) {
        selectedLivingFloorTitle = LivingFloowModel.allCases[index].description
    }

}
