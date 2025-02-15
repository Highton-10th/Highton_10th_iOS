//
//  FeedHeader.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct FeedHeader: View {
    let profileImage: String
    let name: String
    let title: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            AsyncImage(url: URL(string: profileImage)) { image in
                image
                    .resizable()
            } placeholder: {
                Rectangle()
                    .foregroundStyle(Color.gray)
            }
            .cornerRadius(.radius12)
            .frame(width: 36, height: 36)
            
            VStack(spacing: 2) {
                Text(name)
                    .font(.highFootnote.font)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.rootStrong)
                    .padding(.horizontal, 4)
                
                Text(title)
                    .font(.highCallout.font)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.base)
                    .padding(.horizontal, 4)
            }
            .padding(.vertical, 10)
        }
        .padding(.horizontal, 16)
    }
}
