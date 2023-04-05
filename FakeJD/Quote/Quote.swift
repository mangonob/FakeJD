//
//  Quote.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/31.
//

import SwiftUI

struct Quote: View {
    @State var currentIndex = 0
    
    var body: some View {
        ScrollView {
            SegmentControl(currentIndex: $currentIndex, options: [
                "全部",
                "美股",
                "港股",
                "沪深",
                "伦敦",
                "新加坡",
                "澳洲",
            ])
        }
        .background(Color.backgroundDeep)
        .preferredStatusBarColorScheme(.light)
    }
}

struct Quote_Previews: PreviewProvider {
    static var previews: some View {
        Quote()
    }
}
