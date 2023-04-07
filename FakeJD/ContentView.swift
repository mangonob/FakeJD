//
//  ContentView.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct ContentView: View {
    @State var statusBarStyle: ColorScheme = .dark
    @State var rootType: RootType = .launch
    
    var body: some View {
        NavigationStack {
            Group {
                switch rootType {
                case .launch:
                    Launch()
                case .root:
                    RootTabBar()
                }
            }
            .transition(.opacity)
        }
        .foregroundColor(.textPrimary)
        .font(.primary(size: 16))
        .preferredColorScheme(statusBarStyle == .dark ? .light : .dark)
        .onStatusBarColorSchemeChanged { statusBarStyle = $0 }
        .dynamicTypeSize(.large)
        .task {
            Task {
                try await Task.sleep(for: .seconds(3))
                withAnimation(.easeOut(duration: 1)) {
                    rootType = .root
                }
            }
        }
    }
}

struct DefaultNavigationContentModifier: ViewModifier {
    var title: String
    
    func body(content: Content) -> some View {
        content
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.visible, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle(title)
    }
}

enum RootType {
    case launch
    case root
}

extension View {
    func defaultNavigate(title: String) -> some View {
        self.modifier(DefaultNavigationContentModifier(title: title))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
