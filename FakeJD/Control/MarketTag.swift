//
//  MarketTag.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI

struct MarketTag: View {
    var market: Market
    
    var textColor: Color {
        switch market {
        case .us:
            return Color(rgb: 0x5480FD)
        case .hk:
            return Color(rgb: 0xF4753C)
        case .sh:
            fallthrough
        case .sz:
            return Color(rgb: 0xE75B57)
        case .ln:
            return Color(rgb: 0x816EF8)
        case .sg:
            return Color(rgb: 0xEA5D96)
        case .au:
            return Color(rgb: 0x52B3F8)
        }
    }
    
    var body: some View {
        Text(market.rawValue.uppercased())
            .font(.system(size: 12, weight: .light))
            .foregroundColor(textColor)
            .padding(.horizontal, 2)
            .background(textColor.opacity(0.2))
            .cornerRadius(2)
    }
}

enum Market: String {
    /** 美股 */
    case us
    /** 港股 */
    case hk
    /** A股（上海） */
    case sh
    /** A股（深圳） */
    case sz
    /** 伦敦 */
    case ln
    /** 新加坡 */
    case sg
    /** 澳大利亚 */
    case au
}

struct MarketTag_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            MarketTag(market: .us)
            MarketTag(market: .hk)
            MarketTag(market: .sh)
            MarketTag(market: .sz)
            MarketTag(market: .ln)
            MarketTag(market: .sg)
            MarketTag(market: .au)
        }
        .preferredColorScheme(.dark)
    }
}
