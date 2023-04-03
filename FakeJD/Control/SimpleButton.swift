//
//  SimpleButton.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI

struct SimpleButton: View {
    enum Style {
        case primary
        case danger
        case text
    }
    
    var title: String
    var style: Style = .primary
    var padding = EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
    var action: VoidCallback?
    
    var backgroundColor: Color {
        switch style {
        case .primary:
            return .mainColor
        case .danger:
            return .mainColor
        case .text:
            return .clear
        }
    }
    
    var textColor: Color {
        switch style {
        case .primary:
            return .backgroundContentSecondary
        case .danger:
            return .backgroundContentSecondary
        case .text:
            return .textPrimary
        }
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .medium))
            .frame(maxWidth: .infinity)
            .padding(padding)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .onTapGesture {
                action?()
            }
            .cornerRadius(4)
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SimpleButton(title: "Primary", style: .primary)
            SimpleButton(title: "Danger", style: .danger)
            SimpleButton(title: "Text", style: .text)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(16)
        .background(.black)
    }
}
