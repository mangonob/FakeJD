//
//  RootTabBar.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct RootTabBar: View {
    @State var selectedIndex: Int = 100
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            Home().tabItem {
                Label("首页", systemImage: "house")
            }
            .tag(0)
            Quote().tabItem {
                Label("行情", systemImage: "chart.line.uptrend.xyaxis")
            }
            .tag(1)
            Community().tabItem {
                Label("社区", systemImage: "bubble.left.and.exclamationmark.bubble.right")
            }
            .tag(2)
            OpenAccount().tabItem {
                Label("开户", systemImage: "chart.pie")
            }
            .tag(3)
            Mine().tabItem {
                Label("我的", systemImage: "person")
            }
            .tag(4)
        }
        .tint(.mainColor)
        .ignoresSafeArea(.keyboard)
        .defaultTabBarAppearence()
    }
}

struct DefaultTabBarAppaerenceModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .onAppear{
                let appearence = UITabBarAppearance()
                appearence.configureWithDefaultBackground()
                appearence.backgroundColor = UIColor(Color.backgroundContent)
                appearence.shadowColor = UIColor(Color.borderTertiary)
                UITabBar.appearance().isTranslucent = false
                UITabBar.appearance().standardAppearance = appearence
                UITabBar.appearance().scrollEdgeAppearance = appearence
                UITabBar.appearance().unselectedItemTintColor = UIColor.red
            }
    }
}

extension View {
    func defaultTabBarAppearence() -> some View {
        modifier(DefaultTabBarAppaerenceModifier())
    }
}

struct RootTabBar_Previews: PreviewProvider {
    static var previews: some View {
        RootTabBar()
    }
}
