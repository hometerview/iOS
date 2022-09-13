//
//  BaseViewModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/13.
//

import Foundation
import Combine

class BaseViewModel {
    var isToastShow: Bool = false
    var toastMessage: String = ""

    var cancellable = Set<AnyCancellable>()
}
