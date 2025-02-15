//
//  StatusCase.swift
//  highton_10
//
//  Created by 최시훈 on 2/12/25.
//

import SwiftUI

enum StatusCase {
    case normal
    case normalStrock
    case success
    case successStrock
    case failure
    case failureStrock
    
    var color: Color {
        switch self {
        case .normal:
            return Color.contentAssistive
        case .normalStrock:
            return Color.contentAssistive
        case .success:
            return .successStrong
        case .successStrock:
            return .successRegular
        case .failure:
            return .dangerStrong
        case .failureStrock:
            return .dangerRegular
        }
    }
}
