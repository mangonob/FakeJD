//
//  AnimationView.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI
import libpag

struct AnimationView: UIViewRepresentable {
    var resourceName: String
    var isActive: Bool = false
    var repeatCount: Int = 1
    
    typealias UIViewType = PAGView
    
    func makeUIView(context: Context) -> PAGView {
        let view = PAGView()
        view.setPath(Bundle.main.path(forResource: resourceName, ofType: "pag"))
        view.setProgress(1)
        view.setRepeatCount(Int32(repeatCount))
        return view
    }
    
    func updateUIView(_ uiView: PAGView, context: Context) {
        uiView.setRepeatCount(Int32(repeatCount))
        
        if (isActive) {
            uiView.play()
        } else {
            uiView.stop()
            uiView.setProgress(0)
        }
    }
}

fileprivate struct AnimationDemo: View {
    @State var isActive = false
    
    var body: some View {
        VStack {
            Group {
                AnimationView(resourceName: "tabbar_v80_tab_0", isActive: isActive)
                AnimationView(resourceName: "tabbar_v80_tab_1", isActive: isActive)
                AnimationView(resourceName: "tabbar_v80_tab_2", isActive: isActive)
                AnimationView(resourceName: "tabbar_v80_tab_3", isActive: isActive)
                AnimationView(resourceName: "tabbar_v80_tab_4", isActive: isActive)
            }
            .frame(width: 40, height: 40)
            
            Toggle(isOn: $isActive) {
                Text("On")
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
