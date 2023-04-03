//
//  NavigationBar.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/31.
//

import SwiftUI

struct NavigationBar: View {
    var progress: Double = 1
    
    private var foregroundColor: Color {
        progress > 0.5 ? .white : .black
    }
    
    var body: some View {
        HStack {
            ZStack {
                ForEach(0..<3, id: \.self) { _ in
                    Image("tiger")
                        .resizable()
                        .blendMode(.plusDarker)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 24)
                }
            }
            .background(Circle().foregroundColor(.mainColor).padding(1))
            
            Group {
                Text("老虎國際")
                Spacer()
                Image(systemName: "magnifyingglass").padding(4)
                Image(systemName: "text.bubble").padding(4)
            }
            .foregroundColor(foregroundColor)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(minHeight: 44)
        .background(Color.backgroundContent.opacity(progress))
        .foregroundColor(.clear)
        .padding(.bottom, -1)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
