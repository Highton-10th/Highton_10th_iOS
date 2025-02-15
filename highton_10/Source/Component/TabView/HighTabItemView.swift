//
//  HighTabItemView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI


struct HighTabItemView<Content: View>: HighTabItemViewProtocol {
    let title: String
    let image: Image
    let content: AnyView
    
    init(title: String,
         image: Image,
         @ViewBuilder content: () -> Content)
    {
        self.title = title
        self.image = image
        self.content = AnyView(content())
    }
    
    var body: some View { EmptyView() }
}

struct HighTabItemModifier: ViewModifier {
    let title: String
    let image: Image
    
    public func body(content: Content) -> some View {
        content
    }
}

protocol HighTabItemViewProtocol: View {
    var title: String { get }
    var image: Image { get }
    var content: AnyView { get }
}
