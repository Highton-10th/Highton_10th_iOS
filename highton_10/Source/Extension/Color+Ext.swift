//
//  Color.swift
//  highton_10
//
//  Created by 최시훈 on 2/2//25.
//


import SwiftUI

extension Color {
    // Background
    static let backgroundPrimary = Color("Background/primary")
    static let backgroundSecondary = Color("Background/secondary")
    static let backgroundTertiary = Color("Background/tertiary")
    
    // Border
    static let borderDivider = Color("Border/divider")
    static let borderOutline = Color("Border/outline")
    
    // Brand
    static let brandRegular = Color.hex("4266EB", opacity: 0.08)
    static let brandStrong = Color.hex(("4266EB"), opacity: 1.0)

    // Calendar
    static let calendarEvent = Color("Color/Calendar/event")
    static let calendarExam = Color("Color/Calendar/exam")
    static let calendarHome = Color("Color/Calendar/home")
    static let calendarStay = Color("Color/Calendar/stay")
    static let calendarVacation = Color("Color/Calendar/vacation")
    
    // Content
    static let contentAdditive = Color.hex("1D2133", opacity: 0.8)
    static let contentAssistive = Color.hex("1D2133", opacity: 0.6)
    static let contentBase = Color.hex("1D2133", opacity: 1.0)
    static let contentDisabled = Color.hex("1D2133", opacity: 1.0)
    static let contentElevated = Color.hex("FFFFFF", opacity: 1.0)
    static let contentInverted = Color.hex("EBEDF2", opacity: 1.0)

    // Danger
    static let dangerRegular = Color("Color/Danger/regular")
    static let dangerStrong = Color("Color/Danger/strong")
    
    // Dim
    static let dimRegular = Color("Color/Dim/regular")
    static let dimStrong = Color("Color/Dim/strong")
    static let dimWeak = Color("Color/Dim/weak")
    
    // Fill
    static let fillInteractive = Color("Color/Fill/interactive")
    static let fillInverted = Color("Color/Fill/inverted")
    static let fillRegular = Color("Color/Fill/regular")
    static let fillStatic = Color("Color/Fill/static")
    static let fillStrong = Color("Color/Fill/strong")
    
    // iOS
    static let iOSAccent = Color("Color/iOS/accent")
    
    // Labels
    static let labelsPrimary = Color("Color/Labels/primary")
    static let labelsSecondary = Color("Color/Labels/secondary")
    static let labelsTertiary = Color("Color/Labels/tertiary")
    
    // Material
    static let material1 = Color("Color/Material/1")
    static let material2 = Color("Color/Material/2")
    static let material3 = Color("Color/Material/3")
    static let material4 = Color("Color/Material/4")
    static let material5 = Color("Color/Material/5")
    
    // Miscellaneous
    static let barBoard = Color("Color/Miscellaneous/barBorder")
    
    // Root
    static let rootRegular = Color("Color/Root/Regular")
    static let rootStrong = Color("Color/Root/Strong")
    
    // State
    static let stateFocussed = Color("Color/State/focussed")
    static let stateHover = Color("Color/State/hover")
    static let statePressed = Color("Color/State/pressed")
    
    // Success
    static let successRegular = Color("Color/Success/regular")
    static let successStrong = Color("Color/Success/strong")
    
    // Warning
    static let warningRegular = Color("Color/Warning/regular")
    static let warningStrong = Color("Color/Warning/strong")
    
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
