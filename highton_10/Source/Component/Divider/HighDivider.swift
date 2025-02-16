//
//  HighDivider.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct HighDivider: View {
    let type: HighDividerTypeCase?
    
    init(type: HighDividerTypeCase?) {
        self.type = type
    }
    
    var body: some View {
        switch type ?? .normal {
        case .normal:
            Rectangle()
                .frame(width: 336, height: 1, alignment: .center)
                .foregroundStyle(Color.borderDivider)
        case .wide:
            Rectangle()
                .frame(width: 360, height: 1, alignment: .center)
                .foregroundStyle(Color.borderDivider)
                .padding(.vertical, 3.5)
        }
    }
}

#Preview {
    Divider()
}
