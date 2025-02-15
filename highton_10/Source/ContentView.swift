//
//  ContentView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var status: StatusCase = .normal
    @State var textButtonSizeCase: TextButtonSizeCase = .medium

    var body: some View {
        VStack {
            InputTextField(
                text: $text,
                placeholder: "placehorder",
                status: status,
                leadingView: { AnyView(self.view) },
                trailingView: { AnyView(self.view) }

            )
            
            TextButton(label: "버튼",
                       size: textButtonSizeCase,
                       leadingView: { AnyView(self.view) },
                       trailingView: { AnyView(self.view) }
            )
            VStack {
                ActionButton(label: "레이블", type: .primary) { print("레이블") }
                ActionButton(label: "레이블", type: .secondary) { print("레이블") }
                DoubleActionButton(
                    primaryLabel: "레이블",
                    primaryAction: {
                        print("레이블")
                    },
                    secondaryLabel: "레이블",
                    secondaryAction: {
                        print("레이블")
                    }
                )
                ActionButton(label: "서브 레이블", type: .sub) { print("서브 레이블") }
            }

            
        }
        .padding(.horizontal, 16)
    }
}

extension ContentView {
    var view: some View {
        Image(systemName: "magnifyingglass")
            .foregroundStyle(.gray)
    }
}


#Preview {
    ContentView()
}
