//
//  CornerRadius.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import Foundation

enum CornerRadius {
    case radius4
    case radius8
    case radius12
    case radius14
    case radius16
    case half
    
    var value: CGFloat {
        switch self {
        case .radius4:
            return 4
        case .radius8:
            return 8
        case .radius12:
            return 12
        case .radius14:
            return 14
        case .radius16:
            return 16
        case .half:
            return .infinity // 원형으로 만들기 위해 .infinity 사용
        }
    }
}
