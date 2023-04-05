//
//  SegmentControl.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/5.
//

import SwiftUI

struct SegmentControl: View {
    @Binding var currentIndex: Int
    var options: [String]
    
    @Namespace private var namespace
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                    let isActive = index == currentIndex
                    let elementId = "segment_control_item_\(index)"
                    
                    ScrollViewReader { proxy in
                        Text(option)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(isActive ? .mainColor : .textPrimary)
                            .animation(.none, value: isActive)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    proxy.scrollTo(elementId, anchor: .center)
                                    currentIndex = index
                                }
                            }
                            .overlay(alignment: .bottom) {
                                if (isActive) {
                                    Capsule()
                                        .foregroundColor(.mainColor)
                                        .frame(width: 20, height: 4)
                                        .transition(.offset())
                                        .padding(.bottom, 1)
                                        .matchedGeometryEffect(id: "indicator", in: namespace)
                                }
                            }
                            .id(elementId)
                    }
                }
            }
        }
        .background(Color.backgroundContentSecondary)
    }
}

fileprivate struct SegmentControlDemo: View {
    @State var currentIndex = 0
    
    var body: some View {
        ZStack {
            SegmentControl(currentIndex: $currentIndex, options: [
                "Option1",
                "Option2",
                "Option3",
                "Option4",
                "Option5",
                "Option6",
            ])
        }
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SegmentControlDemo()
            SegmentControlDemo()
            SegmentControlDemo()
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
