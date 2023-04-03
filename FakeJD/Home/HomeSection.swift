//
//  HomeSection.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI

struct HomeSection<Content>: View where Content: View {
    var title: String
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.textPrimary)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.vertical, 16)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.textSecondary)
            }
            
            content()
        }
    }
}

struct HomeSection_Previews: PreviewProvider {
    static var previews: some View {
        HomeSection(title: "Section") {
            Text("Empty")
        }
        .preferredColorScheme(.dark)
    }
}
