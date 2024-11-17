//
//  AnimationView.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI

struct AnimationView: View {
    var resourceName: String
    var isActive: Bool = false
    var repeatCount: Int = 1
    
    var body: some View {
        Text("PAG")
    }
}

#Preview {
    AnimationView(resourceName: "kafjlsd")
}
