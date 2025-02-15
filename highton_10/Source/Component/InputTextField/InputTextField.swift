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
        HStack(spacing: 8) {
            if let leadingView = leadingView {
                leadingView()
                    .frame(width: 24, height: 24)
            }
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(status?.color.opacity(0.5) ?? .contentAssistive)
                }
                
                TextField("", text: $text)
                    .foregroundColor(status?.color ?? .primary)
            }
            
            if let trailingView = trailingView {
                trailingView()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.fillRegular)
        .cornerRadius(.radius12)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}
