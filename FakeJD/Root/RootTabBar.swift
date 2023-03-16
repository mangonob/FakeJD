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
        VStack {
            TabView(selection: $selectedIndex) {
                Examples().tabItem {
                    Label("首页", systemImage: "house")
                }
                .tag(0)
                Products().tabItem {
                    Label("新品", systemImage: "shippingbox")
                }
                .tag(1)
                Descovery().tabItem {
                    Label("逛", systemImage: "creditcard")
                }
                .tag(2)
                Cert().tabItem {
                    Label("购物车", systemImage: "cart")
                }
                .tag(3)
                Mine().tabItem {
                    Label("我的", systemImage: "person")
                }
                .tag(4)
            }
            .tint(.mainColor)
        }
        .ignoresSafeArea(.keyboard)
        .onAppear{
            let appearence = UITabBarAppearance()
            appearence.configureWithDefaultBackground()
            appearence.shadowColor = .gray
            UITabBar.appearance().standardAppearance = appearence
            UITabBar.appearance().scrollEdgeAppearance = appearence
        }
    }
}

struct RootTabBar_Previews: PreviewProvider {
    static var previews: some View {
        RootTabBar()
    }
}
