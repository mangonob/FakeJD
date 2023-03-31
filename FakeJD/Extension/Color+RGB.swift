//
//  Color+RGB.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/31.
//

import SwiftUI
    
extension Color {
    init(rgb: UInt32) {
        self.init(rgba: rgb << 8 | 0xFF)
    }
    
    init(rgba: UInt32) {
        let r = Double(rgba >> 24 & 0xFF)
        let g = Double(rgba >> 16 & 0xFF)
        let b = Double(rgba >> 8 & 0xFF)
        let a = Double(rgba & 0xFF)
        self = Color(red: r / 255.0, green: g / 255.0, blue: b / 255.0, opacity: a / 255.0)
    }
    
    init(_ hexString: String) {
        let hexString = hexString.replacing("#", with: "")
        
        if hexString.count == 6 {
            self = UInt32(hexString, radix: 16).flatMap { value in
                Color(rgb: value)
            } ?? .clear
        } else {
            self = UInt32(hexString, radix: 16).flatMap({ value in
                Color(rgba: value)
            }) ?? .clear
        }
    }
}
