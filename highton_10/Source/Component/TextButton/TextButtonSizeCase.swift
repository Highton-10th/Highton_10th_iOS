//
//  TextButtonSizeCase.swift
//  highton_10
//
//  Created by 최시훈 on 2/2//25.
//

import SwiftUI

enum TextButtonSizeCase {
    case small
    case medium
    case large
    
    var fontSize: CGFloat {
        switch self {
        case .small:
            return 12
        case .medium:
            return 14
        case .large:
            return 16
        }
    }
    
    var bothViewSides: CGFloat {
        switch self {
        case .small:
            return 16
        case .medium:
            return 20
        case .large:
            return 24
        }
    }
    
    var padding: CGFloat {
        switch self {
        case .small:
            return 4
        case .medium:
            return 4
        case .large:
            return 6
        }
    }
}
