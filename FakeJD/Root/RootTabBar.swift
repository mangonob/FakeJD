//
//  RootTabBar.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct RootTabBar: View {
    @State var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedIndex) {
                Home().tag(0)
                Quote().tag(1)
                Community().tag(2)
                OpenAccount().tag(3)
                Mine().tag(4)
            }
            TabBar(selectedIndex: $selectedIndex)
        }
        .tint(.mainColor)
        .ignoresSafeArea(.keyboard)
    }
}

struct RootTabBar_Previews: PreviewProvider {
    static var previews: some View {
        RootTabBar()
    }
}
