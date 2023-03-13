//
//  CertBottomBar.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

struct CertBottomBar: View {
    var body: some View {
        HStack {
            Text("全选")
            VStack(alignment: .leading) {
                Text("合计:¥642.79")
                Text("优惠减:¥42.16 优惠明细")
            }
            Spacer()
            Button("领劵结算(4)") {
            }
            .padding(.all, 8)
            .background(.red)
            .foregroundColor(.white)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

struct CertBottomBar_Previews: PreviewProvider {
    static var previews: some View {
        CertBottomBar()
    }
}
