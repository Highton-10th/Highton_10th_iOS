//
//  View+Ext.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CornerRadius) -> some View {
        self.cornerRadius(radius.value)
    }
    
    func cornerRadius(_ radius: CornerRadius, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius.value, corners: corners))
    }
    
    // 부드러운 모서리 효과를 위한 새로운 함수
    func cornerSmooth(_ radius: CornerRadius, smoothness: CGFloat = 0.5) -> some View {
        let radiusValue = radius.value
        let smallerRadius = radiusValue * (1 - smoothness)
        return self
            .cornerRadius(radiusValue)
            .overlay(
                RoundedRectangle(cornerRadius: radiusValue)
                    .stroke(Color.clear, lineWidth: radiusValue * smoothness * 2)
                    .blur(radius: radiusValue * smoothness)
                    .offset(x: radiusValue * smoothness, y: radiusValue * smoothness)
            )
            .cornerRadius(smallerRadius)
            .mask(
                RoundedRectangle(cornerRadius: smallerRadius)
            )
    }
    
    @ViewBuilder func highTabItem(_ title: String, _ image: Image) -> HighTabItemView<Self> {
        HighTabItemView(title: title, image: image) {
            self
        }
    }

}
