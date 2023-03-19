//
//  Examples.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/17.
//

import SwiftUI

struct Examples: View {
    @EnvironmentObject var appDelegate: AppDelegate
    @Environment(\.dismiss) var dismiss
    @Environment(\.isPresented) var isPresented
    
    @State var isShowSheet: Bool = false
    @State var isOnText = "isOff"
    @State var isActive = false
    @State var isSwitchOn = false
    @AppStorage("currentIndex") var currentIndex = 0
    @AppStorage("pickerValue") var pickerValue = 0
    @State var color: Color = .blue
    @ScaledMetric(relativeTo: .title) var scaled = 1
    @AppStorage("starRating") var starRating = 0
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    if isPresented {
                        Button("Dismiss") {
                            dismiss.callAsFunction()
                        }
                        .padding()
                    }
                    
                    Button("Present") {
                        isShowSheet = true
                    }
                    .padding()
                    
                    StarRating(rating: $starRating)
                        .imageScale(.large)
                    
                    SubwaysCard()
                        .padding()
                    
                    Image("pink_flower")
                        .resizable()
                        .scaledToFit()
                        .overlay(alignment: .bottom) {
                            Text("This photo is wider than it is tall.")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 4)
                                .background(
                                    RoundedRectangle(cornerSize: CGSize(4))
                                        .fill(.black)
                                        .opacity(0.5)
                                )
                                .padding()
                        }
                }
                
                VStack {
                    PageView(currentIndex: $currentIndex, pages: [
                        PageViewExample(text: "A"),
                        PageViewExample(text: "B", color: .green),
                        PageViewExample(text: "C", color: .blue),
                        PageViewExample(text: "D", color: .purple)
                    ])
                    .aspectRatio(1.5, contentMode: .fit)
                    
                    Text("currentIndex: \(currentIndex)")
                }
                
                Text("Scaled \(scaled)")
                    .font(.title)
                    .background(.green)
                    .padding(scaled * 10)
                    .background(.red)
                
                Image(systemName: "chevron.down.circle")
                    .imageScale(.large)
                    .scaleEffect(CGSize(isActive ? 1.5 : 1))
                    .rotationEffect(Angle.degrees(isActive ? 180 : 0))
                    .foregroundColor(isActive ? .red : .green)
                    .frame(width: 100, height: 100)
                    .background(color)
                    .cornerRadius(isActive ? 50 : 0)
                    .onTapGesture {
                        withAnimation {
                            isActive.toggle()
                        }
                    }
                    .animation(.spring(dampingFraction: 0.3), value: isActive)
                
                if (isActive) {
                    SimpleSwitch(isOn: $isSwitchOn)
                        .onChange(of: isSwitchOn, perform: { newValue in
                            isOnText = newValue ? "isOn" : "isOff"
                        })
                        .transition(.slide.combined(with: .opacity))
                }
                
                Text(isOnText)
                
                HStack {
                    Image(systemName: "folder.badge.plus")
                    Image(systemName: "heart.circle.fill")
                    Image(systemName: "alarm")
                }
                .symbolRenderingMode(.multicolor)
                .font(.title)
                .padding(.vertical, 16)
                
                Picker("T", selection: $pickerValue) {
                    Text("A").tag(0)
                    Text("B").tag(1)
                }
                
                ColorPicker.init(selection: $color) {
                    Text("Color")
                }
                .frame(maxWidth: 100 * scaled)
                
                HStack {
                    Group {
                        Rectangle()
                            .foregroundColor(.purple)
                        Circle()
                            .foregroundColor(.orange)
                        RoundedRectangle(cornerSize: .init(8))
                            .foregroundColor(.green)
                        Capsule()
                            .foregroundColor(.blue)
                            .aspectRatio(2, contentMode: .fit)
                    }
                    .aspectRatio(1, contentMode: .fit)
                }
                .padding(10)
            }
        }
        .sheet(isPresented: $isShowSheet, content: {
            Examples()
        })
        .refreshable {
            try? await Task.sleep(for: .milliseconds(1500))
        }
    }
}

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Examples()
        }
    }
}

extension CGSize {
    init(_ radius: CGFloat) {
        self.init(width: radius, height: radius)
    }
}
