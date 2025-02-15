//
//  BounceAnimationButtonStyle.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct BounceAnimationRoundedButtonStyle: ButtonStyle {
    let radius: CornerRadius?

    init(radius: CornerRadius? = .radius8) {
        self.radius = radius
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .cornerRadius(radius ?? .radius8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
