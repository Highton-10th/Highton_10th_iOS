//
//  InputTextField.swift
//  highton_10
//
//  Created by 최시훈 on 2/12/25.
//

import SwiftUI

struct InputTextField: View {
    @Binding var text: String
    let placeholder: String
    var status: StatusCase?
    let leadingView: (() -> AnyView)?
    let trailingView: (() -> AnyView)?
    
    init(
        text: Binding<String>,
        placeholder: String,
        status: StatusCase? = nil,
        leadingView: (() -> AnyView)? = nil,
        trailingView: (() -> AnyView)? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.status = status
        self.leadingView = leadingView
        self.trailingView = trailingView
    }
    
    var body: some View {
        HStack {
            if let leadingView = leadingView {
                leadingView()
            }
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(status?.color.opacity(0.5) ?? .assistive)
                }
                
                TextField("", text: $text)
                    .foregroundColor(status?.color ?? .primary)
            }
            
            if let trailingView = trailingView {
                trailingView()
            }
        }
        .padding()
    }
}
