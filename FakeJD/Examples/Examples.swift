//
//  Examples.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/17.
//

import SwiftUI

struct Examples: View {
    @State var count = 0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
                .onReceive(timer) { output in
                    count += 1
                }
            Button("Stop") {
                timer.upstream.connect().cancel()
            }
        }
    }
}

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        Examples()
    }
}
