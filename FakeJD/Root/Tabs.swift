//
//  Tabs.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/2.
//

import SwiftUI

struct Tabs: View {
    @Binding var selection: Int
    
    var tabs: [any View] = []
    
    var body: some View {
        ZStack {
            ForEach(Array(tabs.map { AnyView($0) }.enumerated()), id: \.offset) { index, view in
                view.visible(index == selection)
            }
        }
    }
}

struct VisibleModifier: ViewModifier {
    var visible: Bool
    
    func body(content: Content) -> some View {
        content.opacity(visible ? 1 : 0)
    }
}

extension View {
    func visible(_ visible: Bool) -> some View {
        modifier(VisibleModifier(visible: visible))
    }
}

private struct TabsDemo: View {
    @State var selection = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Tabs(selection: $selection, tabs: [
                Text("A"),
                Text("B"),
                Text("C"),
                Text("D"),
                Text("E"),
            ])
            TabBar(selectedIndex: $selection)
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        TabsDemo()
    }
}
