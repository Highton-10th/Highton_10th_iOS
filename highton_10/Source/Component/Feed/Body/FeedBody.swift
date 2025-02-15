//
//  FeedBody.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct FeedBody: View {
    let imageURL: String
    
    var body: some View {
        
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
        } placeholder: {
            Rectangle()
                .foregroundStyle(Color.gray)
        }
        .cornerRadius(.radius12)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}
