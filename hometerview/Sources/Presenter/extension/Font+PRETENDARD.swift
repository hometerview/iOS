//
//  Font+PRETENDARD.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/30.
//

import SwiftUI

extension Font {
    static func pretendard(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch weight {
            case .ultraLight: return Font.custom("PRETENDARD-EXTRALIGHT", size: size)
            case .thin: return Font.custom("PRETENDARD-THIN", size: size)
            case .light: return Font.custom("PRETENDARD-LIGHT", size: size)
            case .regular: return Font.custom("PRETENDARD-REGULAR", size: size)
            case .medium: return Font.custom("PRETENDARD-MEDIUM", size: size)
            case .semibold: return Font.custom("PRETENDARD-SEMIBOLD", size: size)
            case .bold	: return Font.custom("PRETENDARD-BOLD", size: size)
            case .heavy: return Font.custom("PRETENDARD-EXTRABOLD", size: size)
            case .black: return Font.custom("PRETENDARD-BLACK", size: size)
            default: return Font.custom("PRETENDARD-REGULAR", size: size)
        }
    }
}
