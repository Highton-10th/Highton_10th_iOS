//
//  ActionButtonTypeCase.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

enum ActionButtonTypeCase {
    case primary
    case secondary
    case sub
    
    var fontType: CGFloat {
        switch self {
        case .primary:
            return 16
        case .secondary:
            return 16
        case .sub:
            return 12
        }
    }
    
    var padding: EdgeInsets {
        switch self {
        case .primary:
            return EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        case .secondary:
            return EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        case .sub:
            return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        }
    }
}
