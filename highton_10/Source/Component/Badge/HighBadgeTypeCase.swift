//
//  HighBadgeTypeCase.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import Foundation

enum HighBadgeTypeCase {
    enum Shape {
        case normal
        case circular
        case circularText
    }
    
    enum Size {
        case small
        case large
    }
    
    enum Style {
        case grayscale
        case accent
        case status(StatusCase)
    }
    
    case badge(shape: Shape, size: Size, style: Style)
}
