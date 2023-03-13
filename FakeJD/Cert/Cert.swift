//
//  Cert.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct Cert: View {
    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(0..<1000) { index in
                    Text("Item \(index)")
                        .badge(index)
                }
            }
            CertBottomBar()
        }
        .badge(42)
    }
}

struct Cert_Previews: PreviewProvider {
    static var previews: some View {
        Cert()
    }
}
