//
//  Quote.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/31.
//

import SwiftUI

struct Quote: View {
    @AppStorage("quote_tab_index") private var storagedCurrentIndex = 0
    @State var currentIndex = 0
    
    enum Tab: Comparable, CaseIterable {
        case descovery
        case watchlist
        case stock
        case future
        case fund
        case global
        
        var localizableDescription: String {
            switch self {
            case .descovery:
                return "发现"
            case .watchlist:
                return "自选"
            case .stock:
                return "股票"
            case .future:
                return "期货"
            case .fund:
                return "基金"
            case .global:
                return "全球"
            }
        }
    }
    
    @ViewBuilder private func tabContent(_ tab: Tab) -> some View {
        switch tab {
        case .descovery:
            Descovery()
        case .watchlist:
            Watchlist()
        case .stock:
            Stock()
        case .future:
            Future()
        case .fund:
            Fund()
        case .global:
            Global()
        }
    }
    
    var body: some View {
        let tabs = Tab.allCases
        
        VStack(spacing: 0) {
            HStack {
                SegmentControl(currentIndex: $currentIndex, options: tabs.map { $0.localizableDescription }, style: .tab)
                // TODO: search and message
            }
            TabView(selection: $currentIndex) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                    tabContent(tab)
                        .clipShape(RoundedCorner(radius: 10, corners: [.topLeft, .topRight]))
                        .tag(index)
                }
            }
            .contentShape(Rectangle())
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .background(Color.backgroundDeep)
        .preferredStatusBarColorScheme(.light)
        .onAppear {
            currentIndex = storagedCurrentIndex
        }
        .onChange(of: currentIndex) { newValue in
            storagedCurrentIndex = newValue
        }
    }
}

struct Quote_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Quote()
        }
        .preferredColorScheme(.dark)
    }
}
