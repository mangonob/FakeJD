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
        ScrollView {
            TextField(text: $text) {
                Text("Input")
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 10, alignment: .top),
                GridItem(.flexible(), spacing: 10, alignment: .top),
            ], spacing: 10) {
                ForEach((0..<4), id: \.self) { index in
                    Text("Item \(index)")
                        .frame(height: 200 + sin(CGFloat(index) / (2 * .pi)) * 100)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 8)
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 4, alignment: .top),
                GridItem(.flexible(), spacing: 4, alignment: .top),
                GridItem(.flexible(), spacing: 4, alignment: .top),
                GridItem(.flexible(), spacing: 4, alignment: .top),
                GridItem(.flexible(), spacing: 4, alignment: .top),
            ], spacing: 4) {
                ForEach((0..<10), id: \.self) { index in
                    NavigationLink {
                        Home()
                    } label: {
                        Text("Item \(index)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.orange)
                            .cornerRadius(4)
                            .aspectRatio(1, contentMode: ContentMode.fill)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [
                    GridItem(.flexible(), spacing: 4, alignment: .top),
                    GridItem(.flexible(), spacing: 4, alignment: .top),
                ], spacing: 4) {
                    ForEach((0..<200), id: \.self) { index in
                        Text("Item \(index)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.pink)
                            .cornerRadius(4)
                            .aspectRatio(1, contentMode: ContentMode.fill)
                    }
                }
                .frame(height: 100)
            }
            .padding(.horizontal, 8)
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 10, alignment: .top),
                GridItem(.flexible(), spacing: 10, alignment: .top),
            ], spacing: 10) {
                ForEach((0...9999), id: \.self) { index in
                    Text("Item \(index)")
                        .frame(height: 200 + sin(CGFloat(index) / (2 * .pi)) * 100)
                        .frame(maxWidth: .infinity)
                        .background(.red)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 8)
        }
        .toolbar(.hidden, for: .navigationBar)
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
