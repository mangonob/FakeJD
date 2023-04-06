//
//  WatchlistTips.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/6.
//

import SwiftUI

struct WatchlistTips: View {
    var viewAction: VoidCallback?
    var closeAction: VoidCallback?
    
    var body: some View {
        HStack(spacing: 0) {
            Text("清明节、耶稣受难日几复活节假期休市安排")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .padding(.leading, 16)
            Text("查看")
                .font(.system(size: 12))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .cornerRadius(4)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.textPrimary, lineWidth: 1)
                }
                .onTapGesture {
                    viewAction?()
                }
            Image(systemName: "multiply")
                .font(.system(size: 12))
                .foregroundColor(.textSecondary)
                .padding(10)
                .contentShape(Rectangle())
                .onTapGesture {
                    closeAction?()
                }
        }
        .clipShape(Rectangle())
        .padding(.vertical, 6)
        .foregroundColor(.textPrimary)
    }
}

struct WatchlistTips_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            WatchlistTips()
        }
        .preferredColorScheme(.dark)
    }
}
