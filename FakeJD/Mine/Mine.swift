//
//  Mine.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/16.
//

import SwiftUI

struct Mine: View {
    var body: some View {
        NavigationLink {
            Examples()
        } label: {
            Text("Example")
        }
        .preferredStatusBarColorScheme(.light)
    }
}

struct Mine_Previews: PreviewProvider {
    static var previews: some View {
        Mine()
    }
}
