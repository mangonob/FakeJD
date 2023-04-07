//
//  TabBar.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/1.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedIndex: Int

    private let data: [(icon: String, title: String)] = [
        (icon: "tabbar_v80_tab_0", title: "首页"),
        (icon: "tabbar_v80_tab_1", title: "行情"),
        (icon: "tabbar_v80_tab_2", title: "社区"),
        (icon: "tabbar_v80_tab_3", title: "开户"),
        (icon: "tabbar_v80_tab_4", title: "我的"),
    ]
    
    var body: some View {
        HStack {
            ForEach(Array(data.enumerated()), id: \.offset) { index, tuple in
                TabItem(
                    isActive: index == selectedIndex,
                    icon: tuple.icon,
                    title: tuple.title
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedIndex = index
                }
            }
        }
        .padding(.vertical, 8)
        .frame(minHeight: 49)
        .background(Color.backgroundContent)
        .overlay(alignment: .top) {
            Rectangle()
                .foregroundColor(.borderTertiary)
                .frame(height: 0.3)
        }
    }
}

struct TabItem: View {
    var isActive: Bool
    var icon: String
    var title: String
    
    var body: some View {
        VStack(spacing: 4) {
            AnimationView(resourceName: icon, isActive: isActive)
                .frame(width: 30, height: 30)
            Text(title)
                .font(.primary(size: 10))
        }
        .foregroundColor(isActive ? .mainColor : .gray)
        .frame(maxWidth: .infinity)
    }
}

struct TabBar_Previews: PreviewProvider {
    @State static var selectedIndex = 0
    
    static var previews: some View {
        TabBar(selectedIndex: $selectedIndex)
            .preferredColorScheme(.dark)
    }
}
