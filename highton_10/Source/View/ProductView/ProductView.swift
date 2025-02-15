//
//  ProductView.swift
//  highton_10
//
//  Created by 서지완 on 2/15/25.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        NavigationBarWhite(title: "앙기모띠", leadingView: {
            AnyView(
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 24, height: 24)
            )
        }, trailingPrimaryView:  { AnyView(
            Image(systemName: "gear")
                .resizable()
                .frame(width: 24, height: 24)
        )}
        )
    }
}

#Preview {
    ProductView()
}
