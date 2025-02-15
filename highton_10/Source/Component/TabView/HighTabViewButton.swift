//
//  HighTabViewButton.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct HighTabViewButton: View {
    
    let label: String
    let image: Image
    let action: () -> ()
    var selected: Bool
    let haptic: UIImpactFeedbackGenerator.FeedbackStyle?
    @State var buttonRect: CGRect = CGRect.zero
    @State var animationState: Int = 0
    @State var touchdownState: Bool = false
    @State var rectangleState: Bool = false
    
    init(_ label: String,
                _ image: Image,
                _ selected: Bool,
                haptic: UIImpactFeedbackGenerator.FeedbackStyle? = nil,
                action: @escaping () -> ())
    {
        self.label = label
        self.image = image
        self.selected = selected
        self.action = action
        self.haptic = haptic
    }
    
    var head: some View {
        ZStack {
            if rectangleState {
                Rectangle()
                    .foregroundColor(Color.stateHover)
                    .cornerSmooth(.radius16)
            }
            VStack(spacing: 3) {
                image
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .scaleEffect(x: animationState == 2 ? 1.1 : 1, y: 1)
                    .scaleEffect(x: 1, y: animationState == 3 ? 1.05 : 1)
                Text(label)
                    .font(.system(size: 11, weight: .medium))
                    .scaleEffect(animationState == 2 ? 1.05 : 1)
            }
            .foregroundColor(selected || touchdownState ? Color.contentBase : Color.contentDisabled)
        }
        .frame(maxWidth: .infinity, maxHeight: 62)
        .scaleEffect(animationState == 1 ? 0.9 : 1)
    }
    
    var body: some View {
        head
            .background(
                GeometryReader { (geometry) -> Color in
                    let rect = geometry.frame(in: .global)
                    DispatchQueue.main.async {
                        buttonRect = rect
                    }
                    return .clear
                }
            )
            .simultaneousGesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { newValue in
                        touchdownState = buttonRect.contains(newValue.location)
                        rectangleState = true
                        withAnimation(.linear(duration: 0.1)) {
                            animationState = 1
                        }
                    }
                    .onEnded { _ in
                        if touchdownState {
                            if let haptic = haptic {
                                UIImpactFeedbackGenerator(style: haptic)
                                    .impactOccurred()
                            }
                            action()
                        }
                        for i in 2..<5 {
                            withAnimation(
                                .linear(duration: 0.1)
                                .delay(Double(i - 2)/10*2)
                            ) {
                                animationState = i == 4 ? 0 : i
                                if i == 2 {
                                    touchdownState = false
                                    rectangleState = false
                                }
                            }
                        }
                    }
            )
    }
}
