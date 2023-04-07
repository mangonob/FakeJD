//
//  InvestmentPlanSection.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/4.
//

import SwiftUI

struct InvestmentPlanSection: View {
    var body: some View {
        HomeSection(title: "定投") {
            VStack(spacing: 16) {
                HStack {
                    MarketTag(market: .us)
                    Text("特斯拉(TSLA)")
                        .font(.primary(size: 16, weight: .medium))
                }
                
                HStack(alignment: .firstTextBaseline) {
                    Rate(value: 3.9518)
                        .font(.primary(size: 24, weight: .medium))
                    Text("5年定投回报")
                        .font(.primary(size: 20))
                        .foregroundColor(.textSecondary)
                }
                
                SimpleButton(title: "创建定投计划")
                
                Group {
                    InvestmentPlanItem(rate: 1.3780, name: "美国超微公司(AMD)", description: "5年定投回报率")
                    InvestmentPlanItem(rate: 1.0609, name: "苹果(AAPL)", description: "5年定投回报率")
                    InvestmentPlanItem(rate: 0.2155, name: "标普500ETF(SPY)", description: "5年定投回报率")
                }
                .padding(.vertical, 8)
            }
            .padding([.leading, .trailing, .bottom], 16)
            .padding(.top, 36)
            .background(Color.backgroundContentSecondary)
            .foregroundColor(.textPrimary)
            .cornerRadius(10)
        }
    }
}

fileprivate struct InvestmentPlanItem: View {
    var rate: Double
    var name: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 6) {
                Rate(value: rate)
                    .font(.primary(size: 16, weight: .medium))
                
                Text(description)
                    .font(.primary(size: 12))
                    .foregroundColor(.textSecondary)
            }
            
            Text(name)
                .font(.primary(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct InvestmentPlanSection_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentPlanSection()
            .preferredColorScheme(.dark)
    }
}
