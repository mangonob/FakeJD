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
    var style: Style = .segment
    var normalFontSize: CGFloat = 16
    var activeFontSize: CGFloat = 20
    
    enum Style {
        case tab
        case segment
    }
    
    @Namespace private var namespace
    
    private func itemId(_ index: Int) -> String {
        "segment_control_item_\(index)"
    }
    
    var tabContent: some View {
        ForEach(Array(options.enumerated()), id: \.offset) { index, option in
            let isActive = index == currentIndex
            
            Text(option)
                .font(.system(size: isActive ? activeFontSize : normalFontSize, weight: .semibold))
                .foregroundColor(isActive ? .mainColor : .textSecondary)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeOut) {
                        currentIndex = index
                    }
                }
                .id(itemId(index))
        }
    }
    
    var segmentContent: some View {
        ForEach(Array(options.enumerated()), id: \.offset) { index, option in
            let isActive = index == currentIndex
            
            Text(option)
                .font(.system(size: normalFontSize, weight: .semibold))
                .foregroundColor(isActive ? .mainColor : .textSecondary)
                .animation(.none, value: isActive)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeOut) {
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
                .id(itemId(index))
        }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(alignment: .center, spacing: 0) {
                    switch (style) {
                    case .segment:
                        segmentContent
                    case .tab:
                        tabContent
                    }
                }
                .onChange(of: currentIndex) { newValue in
                    withAnimation {
                        proxy.scrollTo(itemId(newValue), anchor: .center)
                    }
                }
            }
        }
    }
}

fileprivate struct SegmentControlDemo: View {
    @State var currentIndex = 0
    var style: SegmentControl.Style
    
    var body: some View {
        SegmentControl(currentIndex: $currentIndex, options: [
            "Option1",
            "Option2",
            "Option3",
            "Option4",
            "Option5",
            "Option6",
        ], style: style)
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                SegmentControlDemo(style: .tab)
                SegmentControlDemo(style: .segment)
            }
            .background(Color.backgroundContent)
        }
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
