//
//  Color.swift
//  highton_10
//
//  Created by 최시훈 on 2/2//25.
//


import SwiftUI

extension Color {
    // Background
    static let backgroundPrimary = Color.hex("111012", opacity: 1.0)
    static let backgroundSecondary = Color.hex("0C0B0D", opacity: 1.0)
    static let backgroundTertiary = Color.hex("FFFFFF", opacity: 1.0)
    // Border
    static let borderDivider = Color.hex("EDEBF2", opacity: 0.08)
    static let borderOutline = Color.hex("EDEBF2", opacity: 0.04)
    
    // Brand
    static let brandRegular = Color.hex("7242EB", opacity: 0.12)
    static let brandStrong = Color.hex(("7242EB"), opacity: 1.0)

    // Calendar
    static let calendarEvent = Color.hex("FFBF0F", opacity: 1.0)
    static let calendarExam = Color.hex("16B874", opacity: 1.0)
    static let calendarHome = Color.hex("FF244B", opacity: 1.0)
    static let calendarStay = Color.hex("#FF7F0F", opacity: 1.0)
    static let calendarVacation = Color.hex("#3275FB", opacity: 1.0)
    
    // Content
    static let contentAdditive = Color.hex("EDEBF2", opacity: 0.8)
    static let contentAssistive = Color.hex("EDEBF2", opacity: 0.6)
    static let contentBase = Color.hex("EDEBF2", opacity: 1.0)
    static let contentDisabled = Color.hex("EDEBF2", opacity: 0.4)
    static let contentElevated = Color.hex("FFFFFF", opacity: 1.0)
    static let contentInverted = Color.hex("231D33", opacity: 1.0)
    
    // Danger
    static let dangerRegular = Color.hex("FF244B", opacity: 0.08)
    static let dangerStrong = Color.hex("FF244B", opacity: 1.0)
    
    // Dim
    static let dimRegular = Color.hex("000000", opacity: 0.16)
    static let dimStrong = Color.hex("000000", opacity: 0.24)
    static let dimWeak = Color.hex("000000", opacity: 0.12)
    
    // Fill
    static let fillInteractive = Color.hex("FFFFFF", opacity: 0.04)
    static let fillInverted = Color.hex("EDEBF2", opacity: 1.0)
    static let fillRegular = Color.hex("EDEBF2", opacity: 0.02)
    static let fillStatic = Color.hex("111012", opacity: 1.0)
    static let fillStrong = Color.hex("EDEBF2", opacity: 0.04)
    
    // iOS
    static let iOSAccent = Color.hex("4266EB", opacity: 0.08)
    
    // Labels
    static let labelsPrimary = Color.hex("000000", opacity: 1.0)
    static let labelsSecondary = Color.hex("#3C3C43", opacity: 0.60)
    static let labelsTertiary = Color.hex("3C3C43", opacity: 0.30)
    
    // Material
    static let material1 = Color.hex("FFFFFF", opacity: 0.70)
    static let material2 = Color.hex("FEFFFF", opacity: 0.10)
    static let material3 = Color.hex("FEFFFF", opacity: 1.0)
    static let material4 = Color.hex("FFFFFF", opacity: 1.0)
    static let material5 = Color.hex("FEFFFF", opacity: 1.0)
    
    // Miscellaneous
    static let barBoard = Color.hex("000000", opacity: 0.30)
    
    // Root
    static let rootRegular = Color.hex("111012", opacity: 1.0)
    static let rootStrong = Color.hex("0C0B0D", opacity: 1.0)
    
    // State
    static let stateFocussed = Color.hex("EDEBF2", opacity: 0.08)
    static let stateHover = Color.hex("EDEBF2", opacity: 0.12)
    static let statePressed = Color.hex("EDEBF2", opacity: 0.16)
    
    // Success
    static let successRegular = Color.hex("16B874", opacity: 0.08)
    static let successStrong = Color.hex("16B874", opacity: 1.0)
    
    // Warning
    static let warningRegular = Color.hex("FFBF0F", opacity: 0.08)
    static let warningStrong = Color.hex("#FFBF0F", opacity: 1.0)
    
    static func hex(_ hexString: String, opacity: Double = 1.0) -> Color {
            var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
            
            var rgb: UInt64 = 0
            
            Scanner(string: hexSanitized).scanHexInt64(&rgb)
            
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0
            
            return Color(red: red, green: green, blue: blue, opacity: opacity)
        }
}
