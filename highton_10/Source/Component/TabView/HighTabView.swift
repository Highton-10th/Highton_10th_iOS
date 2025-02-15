//
//  HighTabView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct HighTabView: View {
    
    @State var selected: Int = 0
    let content: [any HighTabItemViewProtocol]
    
    public init<C0: HighTabItemViewProtocol,
                C1: HighTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1]
    }
    
    public init<C0: HighTabItemViewProtocol,
                C1: HighTabItemViewProtocol,
                C2: HighTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2]
    }
    
    public init<C0: HighTabItemViewProtocol,
                C1: HighTabItemViewProtocol,
                C2: HighTabItemViewProtocol,
                C3: HighTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2, cv.3]
    }
    
    public init<C0: HighTabItemViewProtocol,
                C1: HighTabItemViewProtocol,
                C2: HighTabItemViewProtocol,
                C3: HighTabItemViewProtocol,
                C4: HighTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2, cv.3, cv.4]
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ZStack {
                    ForEach(0..<content.count, id: \.self) { idx in
                        content[idx].content
                            .offset(x: { () -> CGFloat in
                                if idx == selected {
                                    return 0
                                } else if idx < selected {
                                    return -10
                                } else {
                                    return 10
                                }
                            }())
                            .opacity(idx == selected ? 1 : 0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.rootStrong)
                
                HStack {
                    Spacer()
                    ForEach(0..<content.count, id: \.self) { idx in
                        HighTabViewButton(content[idx].title,
                                          content[idx].image,
                                          idx == selected) {
                            if selected != idx {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selected = idx
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.vertical, 3)
                .padding(.bottom, 100)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(Color.borderOutline, lineWidth: 0.3))
                .padding(.bottom, geometry.safeAreaInsets.bottom <= 20 ? -100 : -113)
            }
        }
        .background(Color.fillStatic)
    }
}
