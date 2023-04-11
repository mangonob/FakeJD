//
//  TrendChart.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/13.
//

import SwiftUI
import Charts

struct TrendChart<D, Content>: View where D: Plottable, Content: View {
    var data: D
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            content()
        }
    }
}

struct TrendChart_Previews: PreviewProvider {
    static var previews: some View {
        TrendChart(data: 32) {
            Text("A")
            Text("B")
            Text("C")
        }
    }
}
