//
//  Subway.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/17.
//

import SwiftUI

struct Subway: View {
    var length: Int = 5
    
    var body: some View {
        HStack(spacing: 0) {
            Head()
            ForEach(0..<length - 2, id: \.self) { _ in
                Middle()
            }
            Tail()
        }
    }
}

private struct Head: View {
    var body: some View {
        Image(systemName: "train.side.rear.car")
    }
}

private struct Middle: View {
    var body: some View {
        Image(systemName: "train.side.middle.car")
    }
}

private struct Tail: View {
    var body: some View {
        Image(systemName: "train.side.front.car")
    }
}

struct Subway_Previews: PreviewProvider {
    static var previews: some View {
        SubwaysCard()
            .padding()
    }
}

struct SubwayLine: View {
    var lineNo: Int
    var color: Color
    
    var body: some View {
        HStack {
            Text("Line \(lineNo): ")
                .fontWeight(.medium)
            Spacer()
            Subway(length: 8)
                .imageScale(.large)
        }
        .foregroundColor(color)
    }
}

struct SubwaysCard: View {
    static let colors: [Color] = [
        Color(red: 0.32, green: 0.67, blue: 0.37),
        Color(red: 0.67, green: 0.36, blue: 0.13),
        Color(red: 0.31, green: 0.65, blue: 0.85),
        Color(red: 0.76, green: 0.24, blue: 0.14),
        Color(red: 0.58, green: 0.32, blue: 0.65),
        Color(red: 0.36, green: 0.76, blue: 0.72),
        Color(red: 0.08, green: 0.20, blue: 0.65),
        Color(red: 0.67, green: 0.36, blue: 0.13),
        Color(red: 0.52, green: 0.42, blue: 0.44),
        Color(red: 0.89, green: 0.49, blue: 0.58),
        Color(red: 0.38, green: 0.14, blue: 0.25),
        Color(red: 0.63, green: 0.56, blue: 0.67),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(Self.colors.enumerated()), id: \.offset) { index, color in
                SubwayLine(lineNo: index + 1, color: color)
            }
        }
    }
}
