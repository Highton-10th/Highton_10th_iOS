//
//  Foot.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct FeedFoot: View {
    var title: String
    var description: String
    var percent: Int
    var startDate: String
    var endDate: String

    public init(
        title: String,
        description: String,
        percent: Int,
        startDate: String,
        endDate: String
    ) {
        self.title = title
        self.description = description
        self.percent = percent
        self.startDate = startDate
        self.endDate = endDate
    }

    var body: some View {
        VStack(alignment: .leading) {

            Text(title)

            Text(description)

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: geometry.size.width, height: 4)
                        .opacity(0.3)
                        .foregroundColor(.gray)

                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: min(CGFloat(self.percent)/100 * geometry.size.width, geometry.size.width), height: 4)
                        .foregroundColor(.blue)
                        .animation(.linear, value: percent)
                }
            }

            HStack {
                Text(startDate)

                Spacer()

                Text(endDate)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
}

struct test1: View {
    var body: some View {
        FeedFoot(
            title: "뉴진스",
            description: "뉴진스 [How Sweet] 미니 앨범 공동 구매",
            percent: 80,
            startDate: "1월 17일 시작",
            endDate: "2월 27일까지"
        )

    }
}




#Preview {
    test1()
}
