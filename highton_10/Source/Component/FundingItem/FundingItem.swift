//
//  FundingItem.swift
//  highton_10
//
//  Created by 서지완 on 2/15/25.
//

import SwiftUI

struct FundingItem: View {
    let choicCount: Int
    let title: String
    let contentArray: [String]
    let recommendation: Bool
    var action: () -> Void

    @State private var isPressed = false

    init(
        choicCount: Int,
        title: String,
        contentArray: [String],
        recommendation: Bool,
        action: @escaping () -> Void = {}
    ) {
        self.choicCount = choicCount
        self.title = title
        self.contentArray = contentArray
        self.recommendation = recommendation
        self.action = action
    }
    var body: some View {
            Button(action: {
                self.action()
                isPressed.toggle()
            }) {
                HStack(spacing: 8) {
                    Image(isPressed ? "trueIcon" : "falseIcon")

                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(choicCount)명 이상이 선택했어요")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAssistive)

                        Text(title)
                            .font(.highBody.medium.font)

                        ForEach(contentArray.indices, id: \.self) { index in
                            Text("• \(contentArray[index])")
                        }
                        .font(.highFootnote.font)
                        .foregroundStyle(Color.contentAdditive)
                        .padding(.leading, 4)

                    }

                    Spacer()

                    if recommendation {
                        Image("reco")
                    }
                }
                .padding(.horizontal, 16)
            }
            .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    FundingItem(choicCount: 300, title: "스탠딩 “검정치마” 구역", contentArray: ["SONGS TO BRING YOU HOME 콘서트 티켓 (단, 공연 일자는 랜덤)", "10,000원 공연 굿즈 쿠폰"], recommendation: true, action: {})
}
