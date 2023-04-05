//
//  Examples.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/17.
//

import SwiftUI

struct Segment: View {
    @Binding var currentIndex: Int
    @Namespace var namespace
    
    var options: [String]
    
    var body: some View {
        HStack(spacing: -10) {
            ForEach(Array(options.enumerated()), id: \.offset) { offset, option in
                let isActive = offset == currentIndex
                Group {
                    Text(option)
                        .bold(isActive)
                        .padding()
                        .background {
                            if isActive {
                                Capsule(style: .continuous)
                                    .foregroundColor(.mainColor)
                                    .transition(.offset())
                                    .padding(2)
                                    .matchedGeometryEffect(id: "indicator", in: namespace)
                            }
                        }
                        .zIndex(isActive ? -1 : 0)
                        .foregroundColor(isActive ? .black : .textPrimary)
                }
                .onTapGesture {
                    withAnimation {
                        currentIndex = offset
                    }
                }
            }
            .scaledToFit()
        }
        .background(Capsule(style: .continuous).foregroundColor(.backgroundContentSecondary))
    }
}

struct Examples: View {
    @State var currentIndex = 0
    
    var body: some View {
        Segment(currentIndex: $currentIndex, options: [
            "OptionA",
            "OptionB",
            "OptionC",
            "OptionD",
        ])
    }
}

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Examples()
        }
    }
}
