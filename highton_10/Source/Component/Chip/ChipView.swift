//
//  ChipView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct ChipView: View {
    let text: String
    var selected: Bool
    
    var body: some View {
        Text(text)
            .font(.highCallout.font.weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(selected ? Color.fillInverted : Color.fillRegular)
            .foregroundStyle(selected ? Color.contentInverted : Color.contentDisabled)
            .animation(.easeInOut(duration: 0.2), value: selected)
    }
}
