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
    var price: Double
    var rate: Double
    
    var body: some View {
        HStack {
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
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text(String(format: "%.2lf", price))
                Text(String(format: "%.2lf%%", rate * 100))
                    .foregroundColor(.colorForSign(rate))
            }
        }
        .foregroundColor(.textPrimary)
    }
}

struct AssetListItem_Previews: PreviewProvider {
    static var previews: some View {
        AssetListItem(name: "阿里巴巴", assetID: "BABA", market: .us, price: 99.3, rate: -0.0285)
            .preferredColorScheme(.dark)
    }
}
