//
//  AssetListItem.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI


struct AssetListItem: View {
    var name: String
    var assetID: String
    var market: Market
    var price: Double?
    var rate: Double
    var style: Style = .compact
    
    enum Style {
        case compact
        case regular
    }
    
    var assetName: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(name)
                .font(.system(size: 16, weight: .medium))
            
            HStack {
                MarketTag(market: market)
                Text(assetID)
                    .font(.system(size: 14))
                    .foregroundColor(.textSecondary)
            }
        }
    }
    
    var priceView: some View {
        Text(price.flatMap { String(format: "%.2lf", $0) } ?? "--")
    }
    
    var rateView: some View {
        Text(String(format: "%.2lf%%", rate * 100))
            .foregroundColor(.colorForSign(rate))
    }
    
    var body: some View {
        let spacing: CGFloat = 8
        
        Group {
            if style == .compact {
                HStack(spacing: spacing) {
                    assetName
                    Spacer()
                    VStack(alignment: .trailing, spacing: 6) {
                        priceView
                        rateView
                    }
                }
            } else {
                Grid(alignment: .topLeading, horizontalSpacing: 0) {
                    GridRow {
                        assetName
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .gridCellColumns(2)
                        priceView
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        rateView
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .foregroundColor(.textPrimary)
    }
}

struct AssetListItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AssetListItem(name: "阿里巴巴", assetID: "BABA", market: .us, price: 99.3, rate: -0.0285)
            AssetListItem(name: "阿里巴巴", assetID: "BABA", market: .us, price: 99.3, rate: -0.0285, style: .regular)
            AssetListItem(name: "阿里巴巴", assetID: "BABA", market: .us, price: 99.3, rate: -0.0285, style: .regular)
        }
        .preferredColorScheme(.dark)
    }
}
