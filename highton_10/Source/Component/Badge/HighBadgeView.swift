//
//  HighBadgeView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

//struct HighBadgeView: View {
//    let text: String
//    let type: HighBadgeTypeCase
//    var selected: Bool = false
//    let action: (() -> Void)?
//    let leadingView: (() -> AnyView)?
//    init(
//        text: String,
//        type: HighBadgeTypeCase,
//        leadingView: (() -> AnyView)? = nil,
//        action: @escaping () -> Void
//        
//    ) {
//        self.text = text
//        self.type = type
//        self.leadingView = leadingView
//        self.action = action
//    }
//    
//    var body: some View {
//        Button {
//            action
//        } label: {
//            switch type {
//            case .badge(let shape, let size):
//                switch (shape, size) {
//                case (.normal, .small):
//                    HStack(alignment: .center, spacing: 2) {
//                        leadingView
//                        
//                        Text(text)
//                            .font(.highCaption.font)
//                            .foregroundStyle(Color.additive)
//                    }
//                    .padding(.horizontal, 4)
//                    .padding(.vertical, 2)
//                    .background(Color.fillRegular)
//                case (.normal, .large):
//                    HStack(alignment: .center, spacing: 4) {
//                        leadingView
//                        
//                        Text(text)
//                            .font(.highCaption.font)
//                            .foregroundStyle(Color.brandStrong)
//                    }
//                    .padding(.horizontal, 6)
//                    .padding(.vertical, 2)
//                    .background(Color.brandRegular)
//                case (.circularText, .small):
//                    Text(text)
//                        .font(.highFootnote.font)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(.fillInverted)
//                        .cornerRadius(.radius12)
//                case (.circularText, .large, .grayscale):
//                    Text(text)
//                        .font(.highFootnote.font)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(.fillInverted)
//                        .cornerRadius(.radius14)
//                }
//            }
//        }
//        .buttonStyle(BounceAnimationRoundedButtonStyle(radius: .radius4))
//    }
//}
//
//#Preview {
//    Divider()
//}
