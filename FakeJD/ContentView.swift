//
//  ContentView.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct ContentView: View {
    @State var isShow = false
    @State var anchor = 0
    
    var body: some View {
        NavigationStack {
            RootTabBar()
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
