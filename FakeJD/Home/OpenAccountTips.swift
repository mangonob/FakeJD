//
//  OpenAccountTips.swift
//  FakeJD
//
//  Created by 高炼 on 2023/4/3.
//

import SwiftUI

struct OpenAccountTips: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("马上开户")
                        .foregroundColor(.textPrimary)
                        .font(.system(size: 24, weight: .semibold))
                        .padding(.bottom, 4)
                    Group {
                        Text("投资全球 正规券商")
                        Text("极速交易 超低佣金")
                        
                        HStack(spacing: 0) {
                            Text("*仅非中国境内投资者")
                                .fontWeight(.bold)
                            Text("可开户")
                        }
                        .padding(.top, 14)
                    }
                    .foregroundColor(.textSecondary)
                    .font(.system(size: 14))
                }
                .minimumScaleFactor(0.5)
                .scaledToFit()
                
                Spacer()
                
                HStack {
                    Placeholder(title: "占位图")
                        .frame(width: 100)
                        .foregroundColor(.clear)
                }
            }
            
            SimpleButton(title: "马上开户")
            SimpleButton(title: "模拟账户", style: .text)
        }
        .padding(16)
        .background(Color.backgroundContentSecondary)
        .cornerRadius(10)
    }
}

struct OpenAccountTips_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            OpenAccountTips()
        }
        .background(.gray)
        .previewLayout(.fixed(width: 400, height: 300))
    }
}
