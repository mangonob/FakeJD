//
//  Launch.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI

struct Launch: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: geometry.size.height * 0.1)
                AnimationView(resourceName: "launch_animation_lite", isActive: true, repeatCount: 0)
                    .frame(height: 200)
                    .ignoresSafeArea()
                Spacer()
                Text("Global Markets in Your Pocket")
                    .font(.system(size: 15, weight: .light))
                    .padding(.bottom, 16)
                Text("BY TIGER FINTECH")
                    .font(.system(size: 12, weight: .light))
                    .padding(.bottom, 36)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.mainColor)
        }
    }
}

struct Launch_Previews: PreviewProvider {
    static var previews: some View {
        Launch()
    }
}
