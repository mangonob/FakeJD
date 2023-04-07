//
//  HeatMap.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/7.
//

import SwiftUI

struct HeatMap: View {
    var horizontalSpacing: CGFloat = 2
    var verticalSpacing: CGFloat = 2
    var items: [Item]
    
    struct Item {
        var name: String
        var volume: Double
        var rate: Double
    }
    
    var body: some View {
        if items.isEmpty {
            EmptyView()
        } else if items.count == 1 {
            HeatMapCell(item: items.first!)
        } else {
            let half = items.count / 2
            let left = Array(items.prefix(half))
            let right = Array(items.dropFirst(half))
            let leftVolume = left.reduce(0.0) { sum, item in
                sum + item.volume
            }
            let rightVolume = right.reduce(0.0) { sum, item in
                sum + item.volume
            }
            let total = leftVolume + rightVolume
            
            GeometryReader { proxy in
                if proxy.size.width > proxy.size.height  {
                    let remainder = proxy.size.width - horizontalSpacing
                    let leftWidth = remainder * leftVolume / total
                    let rightWidth = remainder * rightVolume / total
                    
                    HStack(spacing: horizontalSpacing) {
                        HeatMap(
                            horizontalSpacing: horizontalSpacing,
                            verticalSpacing: verticalSpacing,
                            items: left
                        )
                        .frame(maxWidth: leftWidth)
                        HeatMap(
                            horizontalSpacing: horizontalSpacing,
                            verticalSpacing: verticalSpacing,
                            items: right
                        )
                        .frame(maxWidth: rightWidth)
                    }
                } else {
                    let remainder = proxy.size.height - verticalSpacing
                    let leftHeight = remainder * leftVolume / total
                    let rightHeight = remainder * rightVolume / total
                    
                    VStack(spacing: verticalSpacing) {
                        HeatMap(
                            horizontalSpacing: horizontalSpacing,
                            verticalSpacing: verticalSpacing,
                            items: left
                        )
                        .frame(maxHeight: leftHeight)
                        HeatMap(
                            horizontalSpacing: horizontalSpacing,
                            verticalSpacing: verticalSpacing,
                            items: right
                        )
                        .frame(maxHeight: rightHeight)
                    }
                }
            }
        }
    }
}

private struct HeatMapCell: View {
    var item: HeatMap.Item
    
    var body: some View {
        let rateAbs = abs(item.rate)
        let opacity =  rateAbs > 0.028 ? 0.3 : rateAbs > 0.017 ? 0.5 : 1
        Text(item.name)
            .foregroundColor(.textPrimary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
            .background(
                Color.colorForSign(item.rate, positive: .deepRed, negetive: .deepGreen)
                    .opacity(opacity)
            )
            .lineLimit(2)
            .minimumScaleFactor(0.5)
            .cornerRadius(2)
    }
}

extension DataProvider {
    static var heatMapData: [HeatMap.Item] = [
        .init(name: "互动媒体与服务", volume: 3.51, rate: 0.034),
        .init(name: "系统软件", volume: 2.84, rate: 0.0217),
        .init(name: "制药", volume: 2.83, rate: 0.0084),
        .init(name: "电脑硬件、设备及电脑", volume: 2.76, rate: 0.005),
        .init(name: "半导体产品", volume: 2.59, rate: -0.003),
        .init(name: "综合性银行", volume: 2.3, rate: -0.0054),
        .init(name: "综合性石油与天然气", volume: 1.73, rate: -0.0132),
        .init(name: "互联网与直销零售", volume: 1.68, rate: 0.0131),
        .init(name: "应用软件", volume: 1.55, rate: 0.0026),
        .init(name: "生物科技", volume: 1.39, rate: 0.0110),
        .init(name: "数据处理与外包服务", volume: 1.39, rate: 0.0001),
        .init(name: "多媒体控股", volume: 1.38, rate: 0.0111),
        .init(name: "汽车制造商", volume: 1.12, rate: -0.0046),
        .init(name: "电力公用事业", volume: 1.11, rate: 0.0107),
        .init(name: "航天航空与国防", volume: 0.7939, rate: -0.008),
        .init(name: "大卖场与超市", volume: 0.7920, rate: -0.0046),
        .init(name: "生命科技工具和服务", volume: 0.7708, rate: -0.0038),
        .init(name: "软饮料", volume: 0.7328, rate: 0.0015),
        .init(name: "区域性银行", volume: 0.7249, rate: 0.0089),
        .init(name: "管理型保健护理", volume: 0.7207, rate: 0.0051),
        .init(name: "石油与天然气的勘探与生产", volume: 0.6912, rate: -0.0123),
        .init(name: "资产管理与托管银行", volume: 0.5863, rate: 0.0015),
        .init(name: "半导体设备", volume: 0.5846, rate: -0.0117),
        .init(name: "石油与天然气的储存与运输", volume: 0.5811, rate: -0.0060),
        .init(name: "餐馆", volume: 0.5749, rate: 0.0003),
        .init(name: "电影与娱乐", volume: 0.5325, rate: 0.0034),
        .init(name: "居家用品", volume: 0.5275, rate: 0.0059),
        .init(name: "信息科技咨询与其他服务", volume: 0.5266, rate: -0.0032),
        .init(name: "综合电信业务", volume: 0.5157, rate: 0.0016),
        .init(name: "包装食品与肉类", volume: 0.5029, rate: -0.0018),
    ]
}

struct HeatMap_Previews: PreviewProvider {
    static var previews: some View {
        HeatMap(items: DataProvider.heatMapData)
            .preferredColorScheme(.dark)
            .frame(width: 100, height: 200)
    }
}
