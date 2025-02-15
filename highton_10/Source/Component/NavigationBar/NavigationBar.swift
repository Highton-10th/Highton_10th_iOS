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
    
    init(
        title: String,
        leadingView: (() -> AnyView)? = nil,
        trailingPrimaryView: (() -> AnyView)? = nil,
        trailingSecondView: (() -> AnyView)? = nil
    ) {
        self.title = title
        self.leadingView = leadingView
        self.trailingPrimaryView = trailingPrimaryView
        self.trailingSecondView = trailingSecondView
    }
    var body: some View {
        HStack(spacing: 8) {
            
            if let leadingView = leadingView {
                leadingView()
                    .frame(width: 24, height: 24)
            }
            
            Text(title)
                .font(.highTitle.semiBold.font)
            
            Spacer()
            
            if let trailingPrimaryView = trailingPrimaryView {
                trailingPrimaryView()
                    .frame(width: 24, height: 24)
            }
            
            
            if let trailingSecondView = trailingSecondView {
                trailingSecondView()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 8)
            }
            
        }
        .padding(.horizontal, 20)
    }
}

struct NavigationBarWhite: View {
    let title: String
    let leadingView: (() -> AnyView)?
    let trailingPrimaryView: (() -> AnyView)?
    let trailingSecondView: (() -> AnyView)?
    
    init(
        title: String,
        leadingView: (() -> AnyView)? = nil,
        trailingPrimaryView: (() -> AnyView)? = nil,
        trailingSecondView: (() -> AnyView)? = nil
    ) {
        self.title = title
        self.leadingView = leadingView
        self.trailingPrimaryView = trailingPrimaryView
        self.trailingSecondView = trailingSecondView
    }
    
    var body: some View {
        HStack(spacing: 8) {
            if let leadingView = leadingView {
                leadingView()
                    .frame(width: 24, height: 24)
            }
            Text(title)
                .font(.highTitle.semiBold.font)
                .foregroundStyle(.white)
            
            Spacer()
            
            if let trailingPrimaryView = trailingPrimaryView {
                trailingPrimaryView()
                    .frame(width: 24, height: 24)
            }
            
            if let trailingSecondView = trailingSecondView {
                trailingSecondView()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 8)
            }
            
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
