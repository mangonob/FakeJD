//
//  WatchlistDashboard.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/6.
//

import SwiftUI

struct WatchlistDashboard: View {
    @State var tabIndex = 0
    @State var isExpand = false
    
    @ViewBuilder var header: some View {
        if (isExpand) {
            let tabs = Watchlist.Tab.allCases.dropFirst()
            SegmentControl(
                currentIndex: $tabIndex,
                options: tabs.map { $0.localizationDescription },
                style: .tab,
                normalFontSize: 14,
                activeFontSize: 14
            )
            .padding(.leading, -8)
        } else {
            WatchlistDashboardListItem(name: "道琼斯", price: 33482.72, rate1: 0.8034, rate2: 0.024)
                .padding(.vertical, 8)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                header
                Image(systemName: isExpand ? "chevron.down" : "chevron.up")
                    .foregroundColor(Color.textSecondary)
                    .font(.system(size: 12))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    isExpand.toggle()
                }
            }
            
            if (isExpand) {
                VStack(spacing: 20) {
                    WatchlistDashboardListItem(name: "道琼斯", price: 33482.72, rate1: 0.8034, rate2: 0.024)
                    WatchlistDashboardListItem(name: "纳斯达克", price: 11996.86, rate1: 129.47, rate2: 0.0107)
                    WatchlistDashboardListItem(name: "道琼斯", price: 4090.38, rate1: 0.1022, rate2: 0.025)
                }
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 16, trailing: 10))
            }
        }
        .background(Color.backgroundContent)
        .clipShape(RoundedCorner(radius: 10, corners: [.topLeft, .topRight]))
        .foregroundColor(Color.textPrimary)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

private struct WatchlistDashboardListItem: View {
    var name: String
    var price: Double
    var rate1: Double
    var rate2: Double
    
    var body: some View {
        HStack(spacing: 16) {
            Text(name)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(String(format: "%.2lf", price))
            Rate(value: rate1)
            Rate(value: rate2)
        }
        .font(.system(size: 14, weight: .semibold))
    }
}

struct WatchlistDashboard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            WatchlistDashboard()
            WatchlistDashboard(isExpand: true)
        }
    }
}
