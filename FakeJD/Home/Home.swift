//
//  Home.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct Home: View {
    @State var text: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(height: 200)
                .foregroundColor(Color.mainColor)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                NavigationBar()
                
                ScrollView {
                    Rectangle()
                        .frame(height: 1000)
                        .foregroundColor(.backgroundContentSecondary)
                        .cornerRadius(10)
                        .padding(20)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundDeep)
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
