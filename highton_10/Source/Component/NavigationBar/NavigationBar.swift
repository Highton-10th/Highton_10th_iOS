//
//  NavigationBar.swift
//  highton_10
//
//  Created by 서지완 on 2/15/25.
//

import SwiftUI

struct NavigationBar: View {
    let title: String
    let leadingView: (() -> AnyView)?
    let trailingPrimaryView: (() -> AnyView)?
    let trailingSecondView: (() -> AnyView)?
    var action: () -> Void

    init(
        title: String,
        leadingView: (() -> AnyView)? = nil,
        trailingPrimaryView: (() -> AnyView)? = nil,
        trailingSecondView: (() -> AnyView)? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.leadingView = leadingView
        self.trailingPrimaryView = trailingPrimaryView
        self.trailingSecondView = trailingSecondView
        self.action = action
    }
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                self.action()
            }) {
                if let leadingView = leadingView {
                    leadingView()
                        .frame(width: 24, height: 24)
                }
            }
            .buttonStyle(PlainButtonStyle())

            Text(title)
                .font(.highTitle.semiBold.font)

            Spacer()

            Button(action: {
                self.action()
            }) {
                if let trailingPrimaryView = trailingPrimaryView {
                    trailingPrimaryView()
                        .frame(width: 24, height: 24)
                }
            }
            .buttonStyle(PlainButtonStyle())


            Button(action: {
                self.action()
            }) {
                if let trailingSecondView = trailingSecondView {
                    trailingSecondView()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 8)
                }
            }
            .buttonStyle(PlainButtonStyle())

        }
        .padding(.horizontal, 20)
    }
}

struct NavigationBarWhite: View {
    let title: String
    let leadingView: (() -> AnyView)?
    let trailingPrimaryView: (() -> AnyView)?
    let trailingSecondView: (() -> AnyView)?
    var action: () -> Void

    init(
        title: String,
        leadingView: (() -> AnyView)? = nil,
        trailingPrimaryView: (() -> AnyView)? = nil,
        trailingSecondView: (() -> AnyView)? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.leadingView = leadingView
        self.trailingPrimaryView = trailingPrimaryView
        self.trailingSecondView = trailingSecondView
        self.action = action
    }
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                self.action()
            }) {
                if let leadingView = leadingView {
                    leadingView()
                        .frame(width: 24, height: 24)
                }
            }
            .buttonStyle(PlainButtonStyle())

            Text(title)
                .font(.highTitle.semiBold.font)
                .foregroundStyle(.white)

            Spacer()

            Button(action: {
                self.action()
            }) {
                if let trailingPrimaryView = trailingPrimaryView {
                    trailingPrimaryView()
                        .frame(width: 24, height: 24)
                }
            }
            .buttonStyle(PlainButtonStyle())


            Button(action: {
                self.action()
            }) {
                if let trailingSecondView = trailingSecondView {
                    trailingSecondView()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 8)
                }
            }
            .buttonStyle(PlainButtonStyle())

        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    NavigationBar(title: "앙기모띠", leadingView: {
        AnyView(
            Image(systemName: "gear")
                .resizable()
                .frame(width: 24, height: 24)
        )
    }, trailingPrimaryView:  { AnyView(
        Image(systemName: "gear")
            .resizable()
            .frame(width: 24, height: 24)
    )}
    )
}
