//
//  ActionButton.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct ActionButton: View {
    let label: String
    let type: ActionButtonTypeCase
    var action: () -> Void

    
    init(
        label: String,
        type: ActionButtonTypeCase,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.type = type
        self.action = action

    }
    
    var body: some View {
        HStack {
            switch type {
            case .primary:
                Button {
                    action()
                } label: {
                    Text(label)
                        .font(.suit(type.fontType, weight: .regular))
                        .foregroundStyle(Color.elevated)
                        .frame(maxWidth: .infinity, maxHeight: 56, alignment: .center)
                        .background(Color.brandStrong)
                }
                .buttonStyle(BounceAnimationRoundedButtonStyle())

            case .secondary:
                Button {
                    action()
                } label: {
                    Text(label)
                        .font(.suit(type.fontType, weight: .regular))
                        .foregroundStyle(Color.brandStrong)
                        .frame(maxWidth: .infinity, maxHeight: 56, alignment: .center)
                        .background(Color.brandRegular)
                }
                .buttonStyle(BounceAnimationRoundedButtonStyle())
                
            case .sub:
                Button {
                    action()
                } label: {
                    Text(label)
                        .font(.suit(type.fontType, weight: .regular))
                        .foregroundStyle(Color.assistive)
                        .frame(maxWidth: .infinity, maxHeight: 56, alignment: .center)
                }
                .buttonStyle(BounceAnimationRoundedButtonStyle())
            }
        }
    }
}
