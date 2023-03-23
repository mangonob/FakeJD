//
//  ContentView.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Image("environment-values-hero")
                    .resizable()
                    .scaledToFit()
                    .listRowInsets(EdgeInsets())
                Section {
                    NavigationLink {
                        Examples().defaultNavigate(title: "Examples")
                    } label: {
                        Text("Examples")
                    }
                    NavigationLink {
                        Wave().defaultNavigate(title: "Wave")
                    } label: {
                        Text("Animatable")
                    }
                }
            }
            .toolbar(.visible, for: .navigationBar)
            .navigationTitle("SwiftUI Playground")
        }
        .preferredColorScheme(.light)
        .dynamicTypeSize(.large)
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

extension View {
    func defaultNavigate(title: String) -> some View {
        self.modifier(DefaultNavigationContentModifier(title: title))
    }
}

struct ScrollableModifier: ViewModifier {
    var isScrollable: Bool
    
    func body(content: Content) -> some View {
        if (isScrollable) {
            ScrollView {
                content
            }
        } else {
            content
        }
    }
}

extension View {
    func scrollable() -> some View {
        self.modifier(ScrollableModifier(isScrollable: true))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
