//
//  Home.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct Home: View {
    @State var barProgress: Double = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(height: 200)
                .foregroundColor(Color.mainColor)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                NavigationBar(progress: barProgress)
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ZStack {
                            GeometryReader { geometry in
                                let offset = geometry.frame(in: .named("homeScroll")).minY
                                EmptyView()
                                    .onChange(of: offset) { newValue in
                                        barProgress = min(max(Double(-newValue) / 200, 0), 1)
                                    }
                            }
                        }
                        .frame(height: 0)
                        
                        Rectangle()
                            .frame(height: 10000)
                            .foregroundColor(.backgroundContentSecondary)
                            .cornerRadius(10)
                            .padding(20)
                    }
                }
                .coordinateSpace(name: "homeScroll")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundDeep)
        .preferredStatusBarColorScheme(barProgress > 0.5 ? .light : .dark)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }

    // To make it works also with ScrollView
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}
