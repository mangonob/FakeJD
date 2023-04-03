//
//  Home.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct Home: View {
    @State var barProgress: Double = 0
    @State var backgroundYOffset: Double = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(height: 200)
                .foregroundColor(Color.mainColor)
                .transformEffect(.init(translationX: 0, y: backgroundYOffset))
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                NavigationBar(progress: barProgress)
                
                ScrollView {
                    VStack(spacing: 10) {
                        ZStack {
                            GeometryReader { geometry in
                                let offset = geometry.frame(in: .named("homeScroll")).minY
                                EmptyView()
                                    .onChange(of: offset) { newValue in
                                        let distance: Double = 200
                                        barProgress = min(max(Double(-newValue) / distance, 0), 1)
                                        backgroundYOffset = min(0, newValue)
                                    }
                            }
                        }
                        .frame(height: 0)
                        
                        OpenAccountTips()
                        WatchListSection()
                        InvestmentPlanSection()
                        WatchListSection()
                        WatchListSection()
                        WatchListSection()
                    }
                    .padding(20)
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
