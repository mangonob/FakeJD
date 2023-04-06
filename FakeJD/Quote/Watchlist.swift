//
//  Watchlist.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/6.
//

import SwiftUI

struct Watchlist: View {
    @State var currentIndex = 0
    @State var isTipShow = true
    
    enum Tab: CaseIterable {
        case all
        case us
        case hk
        case sh_sz
        case ln
        case sg
        case au
        
        var localizationDescription: String {
            switch self {
            case .all:
                return "全部"
            case .us:
                return "美股"
            case .hk:
                return "港股"
            case .sh_sz:
                return "沪深"
            case .ln:
                return "伦敦"
            case .sg:
                return "新加坡"
            case .au:
                return "澳洲"
            }
        }
        
        var markets: [Market] {
            switch self {
            case .all:
                return Market.allCases
            case .us:
                return [.us]
            case .hk:
                return [.hk]
            case .sh_sz:
                return [.sh, .sz]
            case .ln:
                return [.ln]
            case .sg:
                return [.sg]
            case .au:
                return [.au]
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if isTipShow {
                WatchlistTips(closeAction:  {
                    withAnimation {
                        isTipShow = false
                    }
                })
            }
            
            let tabs = Tab.allCases
            SegmentControl(currentIndex: $currentIndex, options: tabs.map { $0.localizationDescription })
            
            TabView(selection: $currentIndex) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                    WatchlistWithMarket(markets: tab.markets)
                        .tag(index)
                }
            }
            .contentShape(Rectangle())
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .padding(.bottom, 40)
        .background(Color.backgroundContent)
        .overlay(alignment: .bottom) {
            WatchlistDashboard()
                .shadow(radius: 10)
        }
    }
}

struct Watchlist_Previews: PreviewProvider {
    static var previews: some View {
        Watchlist()
    }
}
