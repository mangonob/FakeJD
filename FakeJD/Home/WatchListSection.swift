//
//  WatchListSection.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/4.
//

import SwiftUI

struct WatchListSection: View {
    var body: some View {
        HomeSection(title: "自选") {
            VStack {
                Group {
                    AssertListItem(name: "SPDR® S&P ® ETF Trust", assetID: "SPY", market: .au, price: 612.26, rate: 0.0162)
                    AssertListItem(name: "SPDR S&P500 US$", assetID: "S27", market: .sg, price: 409.5, rate: -0.0121)
                    AssertListItem(name: "JERSEY OIL&GAS", assetID: "JOG", market: .ln, price: 332.0, rate: 0.4128)
                    AssertListItem(name: "富春股份", assetID: "300299", market: .sz, price: 9.76, rate: 0.2005)
                    AssertListItem(name: "恒大概念", assetID: "BK1598", market: .hk, price: 257.28, rate: -0.0439)
                    AssertListItem(name: "阿里巴巴", assetID: "BABA", market: .us, price: 99.3, rate: 0.0285)
                }
                .padding(.vertical, 10)
            }
            .padding(16)
            .background(Color.backgroundContentSecondary)
            .cornerRadius(10)
        }
    }
}

struct WatchListSection_Previews: PreviewProvider {
    static var previews: some View {
        WatchListSection()
            .preferredColorScheme(.dark)
    }
}
