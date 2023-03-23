//
//  Wave.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/23.
//

import SwiftUI

enum Curve {
    case linear
    case easeIn
    case easeOut
    case easeInOut
}

struct Wave: View {
    @State var isActive = false
    @State var curve: Curve = .linear
    @State var duration: Double = 2
    @State var foregroundColor: Color = .green
    @State var backgroundColor: Color = .green.opacity(0.5)
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Tap ⬇️ to run animation")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "eraser.line.dashed")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        let wave = Wave()
                        curve = wave.curve
                        duration = wave.duration
                        foregroundColor = wave.foregroundColor
                        backgroundColor = wave.backgroundColor
                    }
            }
            
            ZStack(alignment: .bottomTrailing) {
                WaveShape(
                    sizeRatio: isActive ? 0 : 1,
                    count: isActive ? 10 : 4,
                    progress: isActive ? 1 : 0,
                    depth: isActive ? 1 : -0.1
                )
                .clipped()
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .animation(animation, value: isActive)
                
                AnimatedValue(value: isActive ? 100.0 : 0) { value in
                    Text(String(format: "%.2lf%%", value))
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .grayscale(0)
                }
                .animation(animation, value: isActive)
                .padding(6)
                .background(
                    RoundedRectangle(cornerSize: CGSize(10))
                        .foregroundColor(.black.opacity(0.2))
                )
                .padding(10)
            }
            .aspectRatio(1, contentMode: .fit)
            .onTapGesture {
                isActive.toggle()
            }
            
            VStack {
                HStack(spacing: 10) {
                    Text("Curve")
                    Picker("Curve", selection: $curve) {
                        Text("Linear")
                            .tag(Curve.linear)
                        Text("EaseIn")
                            .tag(Curve.easeIn)
                        Text("EaseOut")
                            .tag(Curve.easeOut)
                        Text("EaseInOut")
                            .tag(Curve.easeInOut)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                HStack(spacing: 10) {
                    Text(String(format: "Duration(%.2lfs)", duration))
                    Slider(value: $duration, in: .init(uncheckedBounds: (0.25, 10)), step: 0.25)
                }
                
                HStack(spacing: 20) {
                    ColorPicker(selection: $foregroundColor) {
                        Text("Foreground")
                    }
                    ColorPicker(selection: $backgroundColor) {
                        Text("Background")
                    }
                }
            }
        }
        .padding()
        .background(.white)
    }
    
    var animation: Animation? {
        switch curve {
        case .linear:
            return .linear(duration: duration)
        case .easeIn:
            return .easeIn(duration: duration)
        case .easeOut:
            return .easeOut(duration: duration)
        case .easeInOut:
            return .easeInOut(duration: duration)
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

struct AnimatedView: Animatable, View {
    var width: CGFloat
    var height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(width, height) }
        set {
            width = newValue.first
            height = newValue.second
        }
    }
    
    var body: some View {
        return Rectangle()
            .frame(width: width, height: height)
    }
}

struct AnimatedFrame: Animatable, ViewModifier {
    var height: CGFloat
    var width: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(width, height) }
        set {
            width = newValue.first
            height = newValue.second
        }
    }
    
    func body(content: Content) -> some View {
        return Rectangle()
            .frame(width: width, height: height)
    }
}

struct AnimatedValue<V, Content>: View, Animatable where V: VectorArithmetic, Content: View {
    var value: V
    var builder: (V) -> Content
    
    var animatableData: V {
        get { value }
        set { value = newValue }
    }
    
    var body: some View {
        builder(value)
    }
}

struct WaveShape: Shape {
    var sizeRatio: CGFloat = 0.75
    var count: CGFloat = 2
    var progress: CGFloat = 0
    var depth: CGFloat = 0
    
    typealias AnimatableData = AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, CGFloat>, CGFloat>
    
    var animatableData:  AnimatableData {
        get { AnimatableData(.init(.init(sizeRatio, count), progress), depth) }
        set {
            sizeRatio = newValue.first.first.first
            count = newValue.first.first.second
            progress = newValue.first.second
            depth = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let distance = abs(rect.width / count)
            let period = distance * 2
            var originX = (progress * rect.width).truncatingRemainder(dividingBy: period)
            if originX > 0.01 {
                originX -= period
            }
            let originY = rect.height - depth * rect.height
            let slope = distance / CGFloat.pi
            let size = sizeRatio / CGFloat.pi * distance
            
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
        VStack {
            Wave()
        }
    }
}
