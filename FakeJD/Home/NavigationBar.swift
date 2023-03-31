//
//  NavigationBar.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/31.
//

import SwiftUI

struct NavigationBar: View {
    var backgroundOpacity: Double = 1
    
    var body: some View {
        Rectangle()
            .frame(height: 44)
            .background(Color.backgroundContent.opacity(backgroundOpacity))
            .foregroundColor(.clear)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
