//
//  Wave.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/23.
//

import SwiftUI

struct Wave: View {
    @State var progress: CGFloat = 0.1
    
    var body: some View {
        GeometryReader { context in
            let diameter = min(context.size.height, context.size.width)
            let waveSize = diameter / 80.0 * 3
            let waveCount: CGFloat = 3
            let initialOffset = diameter / waveCount
            
            ZStack{
                Logo().grayscale(1).opacity(0.8)
                Logo().opacity(0.5)
                    .mask {
                        WaveShape(size: waveSize, count: waveCount, initialOffset: initialOffset, progress: progress)
                            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: progress)
                    }
                Logo().opacity(0.8)
                    .mask {
                        WaveShape(size: waveSize, count: waveCount, progress: progress)
                            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: progress)
                    }
            }
        }
        .onAppear {
            progress = 1
        }
    }
}

struct Logo: View {
    var body: some View {
        Image("cj_logo")
            .resizable()
            .scaledToFit()
    }
}

struct WaveShape: Shape {
    var size: CGFloat = 20
    var count: CGFloat = 2
    var initialOffset: CGFloat = 0
    var progress: CGFloat = 0
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let distance = abs(rect.width / count)
            let period = distance * 2
            var originX = (initialOffset + progress * rect.width).truncatingRemainder(dividingBy: period)
            if originX > 0.01 {
                originX -= period
            }
            let originY = rect.height - progress * rect.height
            let slope = distance / CGFloat.pi
            
            path.move(to: CGPoint(x: originX, y: originY))
            let origin = CGPoint(x: originX, y: originY)
            while (originX < rect.width) {
                path.addQuadCurve(
                    to: CGPoint(x: originX + distance / 2, y: originY + size),
                    control: CGPoint(x: originX + slope, y: originY + size)
                )
                path.addQuadCurve(
                    to: CGPoint(x: originX + distance, y: originY),
                    control: CGPoint(x: originX + distance - slope, y: originY + size)
                )
                path.addQuadCurve(
                    to: CGPoint(x: originX + distance * 3 / 2, y: originY - size),
                    control: CGPoint(x: originX + distance + slope, y: originY - size)
                )
                path.addQuadCurve(
                    to: CGPoint(x: originX + period, y: originY),
                    control: CGPoint(x: originX + period - slope, y: originY - size)
                )
                originX += period
            }
            path.addLine(to: CGPoint(x: originX, y: rect.height))
            path.addLine(to: CGPoint(x: origin.x, y: rect.height))
            path.closeSubpath()
        }
    }
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        Wave().frame(width: 100, height: 100)
    }
}
