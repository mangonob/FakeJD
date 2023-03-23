//
//  Examples.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/17.
//

import SwiftUI

struct Examples: View {
    @State var password = ""
    @State var isSecure = true
    
    var body: some View {
        VStack {
            HStack {
                if (isSecure) {
                    SecureField("Password", text: $password)
                } else {
                    TextField("Password", text: $password)
                }
                Image(systemName: "eye").symbolVariant(isSecure ? .slash : .none)
                    .onTapGesture {
                        isSecure.toggle()
                    }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
            .padding()
            
            Grid {
                GridRow {
                    Text("Hello")
                    Image(systemName: "globe")
                }
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("Hello")
                }
            }
            
            Grid {
                GridRow {
                    Text("Row 1")
                    ForEach(0..<2) { _ in Color.red.gridCellColumns(2) }
                }
                GridRow {
                    Text("Row 2")
                    ForEach(0..<5) { _ in Color.green }
                }
                GridRow {
                    Text("Row 3")
                    ForEach(0..<4) { _ in Color.blue }
                }
            }
            
            let colors: [Color] =
                [.red, .orange, .yellow, .green, .blue, .purple]
            
            ZStack(alignment: .topLeading) {
                ForEach(0..<colors.count, id: \.self) {
                    Rectangle()
                        .fill(colors[$0])
                        .frame(width: 100, height: 100)
                        .padding(.leading, CGFloat($0) * 10.0)
                        .padding(.top, CGFloat($0) * 10.0)
                }
            }
            
            LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
                ForEach(1..<10, id: \.self) { section in
                    Section {
                        ForEach(0..<10) { item in
                            Text("Item \(item)")
                                .padding(.bottom)
                                .padding(.top, item == 0 ? nil : 0)
                        }
                    } header: {
                        Text("Section \(section)")
                            .frame(maxWidth: .infinity)
                            .frame(minHeight: 40)
                            .background(.green)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .scrollable()
        .scrollDismissesKeyboard(.immediately)
    }
}

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        Examples()
    }
}
