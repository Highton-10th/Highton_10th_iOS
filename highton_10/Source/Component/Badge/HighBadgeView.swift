//
//  HighBadgeView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct HighBadgeView: View {
    let text: String
    let type: HighBadgeTypeCase
    let action: (() -> Void)?
    let leadingView: (() -> AnyView)?
    init(
        text: String,
        type: HighBadgeTypeCase,
        leadingView: (() -> AnyView)? = nil,
        action: @escaping () -> Void
        
    ) {
        self.text = text
        self.type = type
        self.leadingView = leadingView
        self.action = action
    }
    
    var body: some View {
        Button {
            action
        } label: {
//            switch type {
//            case .badge(let shape, let size, let style):
//                switch (shape, size, style) {
//                case (.normal, .small, .grayscale):
//                    HStack(alignment: .center, spacing: 2) {
//                        leadingView
//                        
//                        Text(text)
//                            .font(.highCaption)
//                            .foregroundStyle(Color.additive)
//                    }
//                    .padding(.horizontal, 4)
//                    .padding(.vertical, 2)
//                    .background(Color.fillRegular)
//                case (.normal, .small, .accent):
//                    HStack(alignment: .center, spacing: 2) {
//                        leadingView
//                            .frame(width: 12, height: 12)
//                        
//                        Text(text)
//                            .font(.highCaption)
//                            .foregroundStyle(Color.brandStrong)
//                    }
//                    .padding(.horizontal, 4)
//                    .padding(.vertical, 2)
//                    .background(Color.brandRegular)
//                case (.normal, .small, .status):
//                    HStack(alignment: .center, spacing: 2) {
//                        leadingView
//                            .frame(width: 12, height: 12)
//                        
//                        Text(text)
//                            .font(.highCaption)
//                            .foregroundStyle(Color.additive)
//                    }
//                    .padding(.horizontal, 4)
//                    .padding(.vertical, 2)
//                    .background(style.status)
//                case (.normal, .large, .grayscale):
//                    HStack(alignment: .center, spacing: 4) {
//                        leadingView
//                            .frame(width: 16, height: 16)
//                        
//                        Text(text)
//                            .font(.highCaption)
//                            .foregroundStyle(Color.additive)
//                    }
//                    .padding(.horizontal, 6)
//                    .padding(.vertical, 2)
//                    .background(Color.fillRegular)
//                case (.normal, .large, .accent):
//                    HStack(alignment: .center, spacing: 4) {
//                        leadingView
//                            .frame(width: 16, height: 16)
//                        
//                        Text(text)
//                            .font(.highCaption)
//                            .foregroundStyle(Color.brandStrong)
//                    }
//                    .padding(.horizontal, 6)
//                    .padding(.vertical, 2)
//                    .background(Color.brandRegular)
//                case (.normal, .large, .status):
//                    HStack(alignment: .center, spacing: 4) {
//                        leadingView
//                            .frame(width: 16, height: 16)
//                            .foregroundStyle(Color.additive)
//                        
//                        Text(text)
//                            .font(.highCaption)
//                            .foregroundStyle(style.status)
//                    }
//                    .padding(.horizontal, 6)
//                    .padding(.vertical, 2)
//                    .background(Color.fillRegular)
//                case (.circular, .small, .grayscale):
//                    Circle()
//                        .frame(width: 4, height: 4)
//                        .foregroundStyle(Color.fillInverted)
//                case (.circular, .small, .accent):
//                    Circle()
//                        .frame(width: 4, height: 4)
//                        .foregroundStyle(Color.brandStrong)
//                case (.circular, .small, .status):
//                    Circle()
//                        .frame(width: 4, height: 4)
//                        .foregroundStyle(style.status)
//                case (.circular, .large, .grayscale):
//                    Circle()
//                        .frame(width:  6, height: 6)
//                        .foregroundStyle(Color.fillInverted)
//                case (.circular, .large, .accent):
//                    Circle()
//                        .frame(width: 6, height: 6)
//                        .foregroundStyle(Color.brandStrong)
//                case (.circular, .large, .status):
//                    Circle()
//                        .frame(width: 6, height: 6)
//                        .foregroundStyle(style.status)
//                case (.circularText, .small, .grayscale):
//                    Text(text)
//                        .font(.highFootnote)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(.fillInverted)
//                        .cornerRadius(.radius12)
//                case (.circularText, .small, .accent):
//                    Text(text)
//                        .font(.highFootnote)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(.brandStrong)
//                        .cornerRadius(.radius12)
//                case (.circularText, .small, .status):
//                    Text(text)
//                        .font(.highFootnote)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(style.status)
//                        .cornerRadius(.radius12)
//                case (.circularText, .large, .grayscale):
//                    Text(text)
//                        .font(.highFootnote)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(.fillInverted)
//                        .cornerRadius(.radius14)
//                case (.circularText, .large, .accent):
//                    Text(text)
//                        .font(.highFootnote)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(.brandStrong)
//                        .cornerRadius(.radius14)
//                case (.circularText, .large, .status):
//                    Text(text)
//                        .font(.highFootnote)
//                        .padding(2)
//                        .foregroundStyle(.inverted)
//                        .background(style.status)
//                        .cornerRadius(.radius14)
//                }
//            }
        }
        .buttonStyle(BounceAnimationRoundedButtonStyle(radius: .radius4))
    }
}

#Preview {
    Divider()
}
