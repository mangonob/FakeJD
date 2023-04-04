//
//  HotpotSection.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/4.
//

import SwiftUI

struct HotpotSection: View {
    @State var isExpanded = false
    
    private var data: [(title: String, assetId: String, source: String, date: String)] = [
        (title: "两种不同估值方法来看阿里巴巴拆分的价值", assetId: "BABA", source: "自选股", date: "03/30"),
        (title: "拆分阿里巴巴，谁追有可能率先独立上市？", assetId: "BABA", source: "自选股", date: "03/29"),
        (title: "【周度分析】3月全国乘用车市场周度零售走势", assetId: "TSLA", source: "自选股", date: "03/29"),
        (title: "分拆重组真的能挽阿里于狂澜吗？", assetId: "BABA", source: "自选股", date: "03/29"),
        (title: "长话短说，中概股目标价", assetId: "BABA", source: "自选股", date: "03/28"),
        (title: "被大头盯上的Block可以买吗？", assetId: "TSLA", source: "自选股", date: "03/28"),
    ]
    
    var body: some View {
        HomeSection(title: "热点洞察") {
            VStack(spacing: 0) {
                ForEach(Array(data.enumerated().dropLast(isExpanded ? 0 : 2)), id: \.offset) { _, data in
                    HotpostListItem(
                        title: data.title,
                        assetId: data.assetId,
                        source: data.source,
                        date: data.date
                    )
                    .padding(.vertical, 14)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(.borderTertiary)
                            .frame(height: 0.5)
                    }
                }
                .transition(.opacity)
                
                HStack(spacing: 2) {
                    Text(isExpanded ? "收起" : "查看更多")
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .font(.system(size: 12))
                .foregroundColor(.textSecondary)
                .padding(16)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
            }
            .padding(.horizontal, 16)
            .background(Color.backgroundContentSecondary)
            .cornerRadius(10)
            .foregroundColor(.textPrimary)
        }
    }
}

fileprivate struct HotpostListItem: View {
    var title: String
    var assetId: String
    var source: String
    var date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .lineLimit(1)
                .font(.system(size: 16))
            
            HStack(spacing: 6) {
                Placeholder()
                    .frame(width: 60, height: 12)
                Text("\(assetId)⋅\(source)")
                Spacer()
                Text(date)
                    .font(.system(size: 10, weight: .semibold))
            }
            .font(.system(size: 12))
            .foregroundColor(.textSecondary)
        }
    }
}

struct HotpotSection_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            HotpotSection()
                .preferredColorScheme(.dark)
        }
    }
}
