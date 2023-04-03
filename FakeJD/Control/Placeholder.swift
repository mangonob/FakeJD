//
//  Placeholder.swift
//  FakeJD
//
//  Created by mangonob on 2023/4/4.
//

import SwiftUI

struct Placeholder: View {
    var title: String?
    
    var body: some View {
        if let title = title {
            ZStack {
                IsolateAreaWatermark(distance: 14)
                Text(title)
                    .foregroundColor(.white)
                    .blendMode(.difference)
            }
        } else {
            IsolateAreaWatermark()
        }
    }
}

struct IsolateAreaWatermark: View {
    var distance: CGFloat = 20
    
    var body: some View {
        Canvas { context, size in
            let far = (size.height + size.width) * sqrt(0.5)
            let lineCount = Int(ceil(far / distance))
            context.clip(to: Rectangle().path(in: .init(origin: .zero, size: size)))
            for i in 0..<lineCount {
                let even = i % 2 == 0
                let slope = distance * sqrt(2)
                let current = CGFloat(i) * slope
                let next = (CGFloat(i) + 1) * slope
                let path = Path { path in
                    path.addLines([
                        .init(x: current, y: 0),
                        .init(x: next, y: 0),
                        .init(x: 0, y: next),
                        .init(x: 0, y: current),
                    ])
                    path.closeSubpath()
                }
                
                context.fill(
                    path,
                    with: .color(even ? .mainColor : .backgroundContent)
                )
            }
        }
    }
}

struct Placeholder_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
        Placeholder(title: "Danger area")
            .frame(width: 100, height: 200)
        Placeholder()
            .frame(width: 100, height: 200)
        }
    }
}
