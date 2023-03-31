//
//  StatusBarColorScheme.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/3.
//

import SwiftUI

fileprivate extension Notification.Name {
    static let preferredStatusBarColorSchemeChanged = Notification.Name("preferredStatusBarColorSchemeChanged")
}

fileprivate struct StatusBarColorSchemeModifier : ViewModifier {
    var onStatusBarColorSchemeChanged: ValueCallback<ColorScheme>
    
    private let statusBarColorSchemePublisher = NotificationCenter.default.publisher(for: .preferredStatusBarColorSchemeChanged)
        .map { $0.userInfo?["value"] as? ColorScheme }
    
    func body(content: Content) -> some View {
        content
            .onReceive(statusBarColorSchemePublisher) { output in
                output.flatMap { onStatusBarColorSchemeChanged($0) }
            }
    }
}

extension View {
    func onStatusBarColorSchemeChanged(_ changed: @escaping ValueCallback<ColorScheme>) -> some View {
        modifier(StatusBarColorSchemeModifier(onStatusBarColorSchemeChanged: changed))
    }
}

fileprivate struct preferredStatusBarColorSchemeModifier: ViewModifier {
    var preferredStatusBarColorScheme: ColorScheme
    
    func updateStatusBarColorScheme(_ colorScheme: ColorScheme) {
        NotificationCenter.default.post(name: .preferredStatusBarColorSchemeChanged, object: nil, userInfo: ["value": colorScheme])
    }
    
    func body(content: Content) -> some View {
        content.onChange(of: preferredStatusBarColorScheme) { newValue in
            updateStatusBarColorScheme(newValue)
        }
        .onAppear {
            updateStatusBarColorScheme(preferredStatusBarColorScheme)
        }
    }
}

extension View {
    func preferredStatusBarColorScheme(_ style: ColorScheme) -> some View {
        modifier(preferredStatusBarColorSchemeModifier(preferredStatusBarColorScheme: style))
    }
}

