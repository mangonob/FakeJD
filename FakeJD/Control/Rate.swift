//
//  Rate.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/4.
//

import SwiftUI

struct Rate: View {
    var value: Double
    
    var body: some View {
        Text(String(format: "%.2lf%%", value * 100))
            .foregroundColor(.colorForSign(value))
    }
}

struct Rate_Previews: PreviewProvider {
    static var previews: some View {
        Rate(value: .pi / 10)
    }
}
