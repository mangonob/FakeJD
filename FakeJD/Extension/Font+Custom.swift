//
//  Font+Custom.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/7.
//

import SwiftUI

extension Font {
    static func primary(size: CGFloat = 16, weight: Font.Weight = .regular) -> Font {
        switch weight {
        case .ultraLight:
            fallthrough
        case .thin:
            fallthrough
        case .light:
            return Font.custom("DINPro-Light", size: size)
        case .regular:
            return Font.custom("DINPro", size: size)
        case .medium:
            fallthrough
        case .semibold:
            return Font.custom("DINPro-Medium", size: size)
        case .bold:
            return Font.custom("DINPro-Blod", size: size)
        case .heavy:
            fallthrough
        case .black:
            return Font.custom("DINPro-Black", size: size)
        default:
            return Font.custom("DINPro", size: size)
        }
    }
}
