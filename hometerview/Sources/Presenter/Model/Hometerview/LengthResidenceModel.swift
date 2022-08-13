//
//  LengthResidenceModel.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/08/14.
//

import Foundation

struct LengthResidenceModel {
    static var currentYear: Int {
        return Calendar.current.component(.year, from: Date())
    }


    static var popupListTitles: [String] {
        var titles = [String]()

        titles = stride(from: currentYear, to: currentYear - 6, by: -1).map({
            if currentYear - 6 == $0 {
                return "\($0)년이전"
            } else {
                return "\($0)년까지"
            }
        })

        titles.append("비공개")

        return titles
    }
}
