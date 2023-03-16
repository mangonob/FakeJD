//
//  StarRating.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/18.
//

import SwiftUI

struct StarRating: View {
    @Binding var rating: Int
    private let maxRating = 5
    
    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { index in
                Image(systemName: "star")
                    .symbolVariant(index <= rating ? .fill : .none)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

struct StarRating_Previews: PreviewProvider {
    @State static var rating = 0
    
    static var previews: some View {
        StarRating(rating: $rating)
    }
}
