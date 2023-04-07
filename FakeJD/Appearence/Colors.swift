//
//  Colors.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

extension Color {
    static let mainColor = Color(rgb: 0xF9E14B)
    
    static let backgroundDeep = Color(rgb: 0x14151B)
    static let backgroundContent = Color(rgb: 0x202129)
    static let backgroundContentSecondary = Color(rgb: 0x262731)
    
    static let borderTertiary = Color(rgb: 0x424352)
    
    static let textPrimary = Color(rgb: 0xFFFFFF)
    static let textSecondary = Color(rgb: 0x9C9CBB)
    
    static let lightPink = Color(rgb: 0xE0625B)
    static let pinkGreen = Color(rgb: 0x61C484)
    
    static let deepRed = Color(rgb: 0xC94049)
    static let deepGreen = Color(rgb: 0x6AA975)
    
    static func colorForSign<T: BinaryFloatingPoint>(_ value: T, positive: Color = .lightPink, negetive: Color = .lightPink, zero: Color = .textSecondary) -> Color {
        if value > 0.0 {
            return positive
        } else if value < 0.0 {
            return negetive
        } else {
            return zero
        }
    }
}

