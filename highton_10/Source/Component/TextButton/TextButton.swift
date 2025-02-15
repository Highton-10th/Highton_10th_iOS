//
//  TextButton.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct TextButton: View {
    let label: String
    let size: TextButtonSizeCase
    let leadingView: (() -> AnyView)?
    let trailingView: (() -> AnyView)?
    
    init(
        label: String,
        size: TextButtonSizeCase,
        leadingView: (() -> AnyView)? = nil,
        trailingView: (() -> AnyView)? = nil
    ) {
        self.label = label
        self.size = size
        self.leadingView = leadingView
        self.trailingView = trailingView
    }
    
    var body: some View {
        HStack {
            if let leadingView = leadingView {
                leadingView()
                    .frame(width: size.bothViewSides, height: size.bothViewSides)
            }

            Text(label)
                .font(.suit(size.fontSize, weight: .regular))
                .padding(.horizontal, size.padding)
            
            if let trailingView = trailingView {
                trailingView()
                    .frame(width: size.bothViewSides, height: size.bothViewSides)
            }
        }
    }
}
