//
//  Color+colorStyle.swift
//  hometerview
//
//  Created by Ok Hyeon Kim on 2022/07/29.
//

import SwiftUI

extension Color {
    enum Config {
        case gray100
        case gray200
        case gray400
        case gray500
        case gray600
        case gray700
        case gray800
        case gray900
        case white
        case blue100
        case blue300
        case bleu600
        case yellow500
        case red500

        var hexCode: String {
            switch self {
                case .gray100: return "#F2F4F6"
                case .gray200: return "#D2D6DB"
                case .gray400: return "#B1B8C0"
                case .gray500: return "#8D94A0"
                case .gray600: return "#6C737D"
                case .gray700: return "#505866"
                case .gray800: return "#393F48"
                case .gray900: return "#1A1E27"
                case .white: return "#FFFFFF"
                case .blue100: return "#EAF3FE"
                case .blue300: return "#4880EE"
                case .bleu600: return "#2B5FC3"
                case .yellow500: return "#F7CF6C"
                case .red500: return "#E25848"
            }
        }
    }

    static func colorStyle(_ config: Config) -> Color {
        return Color.init(hex: config.hexCode)
    }
}
