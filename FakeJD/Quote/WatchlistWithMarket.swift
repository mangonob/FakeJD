//
//  WatchlistWithMarket.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/7.
//

import SwiftUI

struct WatchlistWithMarket: View {
    var markets: [Market]
    
    init(markets: [Market]) {
        self.markets = markets
    }
    
    typealias Data = (name: String, assetId: String, market: Market, price: Double?, rate: Double)
    private var data: [Data] = [
        (name: "滴滴(已退市)", assetId: "DIDI", market: .us, price: nil, rate: 0),
        (name: "雅乐科技", assetId: "YALA", market: .us, price: 3.82, rate: -0.0193),
        (name: "美光科技", assetId: "MU", market: .us, price: 58.43, rate: -0.0270),
        (name: "嘉楠科技", assetId: "CAN", market: .us, price: 2.50, rate: -0.002),
        (name: "RLX科技", assetId: "RLX", market: .us, price: 2.89, rate: -0.0267),
        (name: "阿里巴巴", assetId: "BABA", market: .us, price: 100.70, rate: -0.0223),
        
        (name: "滴滴(已退市)", assetId: "DIDI1", market: .us, price: nil, rate: 0),
        (name: "雅乐科技", assetId: "YALA1", market: .us, price: 3.82, rate: -0.0193),
        (name: "美光科技", assetId: "MU1", market: .us, price: 58.43, rate: -0.0270),
        (name: "嘉楠科技", assetId: "CAN1", market: .us, price: 2.50, rate: -0.002),
        (name: "RLX科技", assetId: "RLX1", market: .us, price: 2.89, rate: -0.0267),
        (name: "阿里巴巴", assetId: "BABA1", market: .us, price: 100.70, rate: -0.0223),
        (name: "滴滴(已退市)", assetId: "DIDI2", market: .us, price: nil, rate: 0),
        (name: "雅乐科技", assetId: "YALA2", market: .us, price: 3.82, rate: -0.0193),
        (name: "美光科技", assetId: "MU2", market: .us, price: 58.43, rate: -0.0270),
        (name: "嘉楠科技", assetId: "CAN2", market: .us, price: 2.50, rate: -0.002),
        (name: "RLX科技", assetId: "RLX2", market: .us, price: 2.89, rate: -0.0267),
        (name: "阿里巴巴", assetId: "BABA2", market: .us, price: 100.70, rate: -0.0223),
        (name: "滴滴(已退市)", assetId: "DIDI3", market: .us, price: nil, rate: 0),
        (name: "雅乐科技", assetId: "YALA3", market: .us, price: 3.82, rate: -0.0193),
        (name: "美光科技", assetId: "MU3", market: .us, price: 58.43, rate: -0.0270),
        (name: "嘉楠科技", assetId: "CAN3", market: .us, price: 2.50, rate: -0.002),
        (name: "RLX科技", assetId: "RLX3", market: .us, price: 2.89, rate: -0.0267),
        (name: "阿里巴巴", assetId: "BABA3", market: .us, price: 100.70, rate: -0.0223),
        (name: "滴滴(已退市)", assetId: "DIDI4", market: .us, price: nil, rate: 0),
        (name: "雅乐科技", assetId: "YALA4", market: .us, price: 3.82, rate: -0.0193),
        (name: "美光科技", assetId: "MU4", market: .us, price: 58.43, rate: -0.0270),
        (name: "嘉楠科技", assetId: "CAN4", market: .us, price: 2.50, rate: -0.002),
        (name: "RLX科技", assetId: "RLX4", market: .us, price: 2.89, rate: -0.0267),
        (name: "阿里巴巴", assetId: "BABA4", market: .us, price: 100.70, rate: -0.0223),
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(data.filter { markets.contains($0.market) }, id: \.assetId) { asset in
                    AssetListItem(
                        name: asset.name,
                        assetID: asset.assetId,
                        market: asset.market,
                        price: asset.price,
                        rate: asset.rate,
                        style: .regular
                    )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
            
            HStack(spacing: 4) {
                Image(systemName: "plus")
                Text("添加股票")
            }
            .foregroundColor(.textPrimary)
            .font(.primary(size: 12))
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.textSecondary, lineWidth: 1)
            }
            .onTapGesture {
                // TODO: descovery stock
            }
            .padding(.top, 30)
            .padding(.bottom, 40)
        }
        .background(Color.backgroundContent)
    }
}

struct WatchlistWithMarket_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistWithMarket(markets: [.us])
            .preferredColorScheme(.dark)
    }
}
