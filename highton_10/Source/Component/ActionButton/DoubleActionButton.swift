//
//  DoubleActionButton.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct DoubleActionButton: View {
    let primaryLabel: String
    var primaryAction: () -> Void
    let secondaryLabel: String
    var secondaryAction: () -> Void
    
    init(
        primaryLabel: String,
        primaryAction: @escaping () -> Void,
        secondaryLabel: String,
        secondaryAction: @escaping () -> Void
    ) {
        self.primaryLabel = primaryLabel
        self.primaryAction = primaryAction
        self.secondaryLabel = secondaryLabel
        self.secondaryAction = secondaryAction
    }
    var body: some View {
        HStack(spacing: 8) {
            Button {
                primaryAction()
            } label: {
                Text(primaryLabel)
                    .font(.suit(16, weight: .regular))
                    .foregroundStyle(Color.elevated)
                    .frame(maxWidth: .infinity, maxHeight: 56, alignment: .center)
                    .background(Color.brandStrong)
            }
            .buttonStyle(BounceAnimationRoundedButtonStyle())
            
            Button {
                primaryAction()
            } label: {
                Text(primaryLabel)
                    .font(.suit(16, weight: .regular))
                    .foregroundStyle(Color.brandStrong)
                    .frame(maxWidth: .infinity, maxHeight: 56, alignment: .center)
                    .background(Color.brandRegular)
            }
            .buttonStyle(BounceAnimationRoundedButtonStyle())
        }
    }
}
