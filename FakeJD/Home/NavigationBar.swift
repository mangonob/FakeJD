//
//  NavigationBar.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/31.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        Rectangle()
            .frame(height: 44)
            .background(Color.backgroundContent)
            .foregroundColor(Color.backgroundContent)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
