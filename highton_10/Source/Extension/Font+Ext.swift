//
//  Font+Ext.swift
//  highton_10
//
//  Created by 최시훈 on 2/2//25.
//

import SwiftUI

extension Font {

        // 스타일 가이드 정의
    static let highDisplay = StyleGuide(size: 48, lineHeight: 70)
    static let highTitle = StyleGuide(size: 24, lineHeight: 34)
    static let highHeadline = StyleGuide(size: 20, lineHeight: 28)
    static let highSubhead = StyleGuide(size: 18, lineHeight: 26)
    static let highBody = StyleGuide(size: 16, lineHeight: 24)
    static let highParagraphLarge = StyleGuide(size: 16, lineHeight: 28.8)
    static let highParagraphSmall = StyleGuide(size: 14, lineHeight: 24)
    static let highCallout = StyleGuide(size: 14, lineHeight: 20)
    static let highFootnote = StyleGuide(size: 12, lineHeight: 18)
    static let highCaption = StyleGuide(size: 10, lineHeight: 14)

    
    static func suit(
        _ size: CGFloat = 16,
        weight: SUITWeight = .regular
    ) -> Font {
        let fontName = "SUIT-\(weight.rawValue)"
        return Font.custom(fontName, size: size)
    }
    
    static func suitUIFont(
        _ size: CGFloat = 16,
        weight: SUITWeight = .regular
    ) -> UIFont {
        let fontName = "SUIT-\(weight.rawValue)"
        if let fontURL = Bundle.main.url(forResource: fontName, withExtension: "otf"),
           let fontData = try? Data(contentsOf: fontURL),
           let provider = CGDataProvider(data: fontData as CFData),
           let cgFont = CGFont(provider) {
            var error: Unmanaged<CFError>?
            if CTFontManagerRegisterGraphicsFont(cgFont, &error) {
                let fontDescriptor = CTFontDescriptorCreateWithAttributes([
                    kCTFontNameAttribute: fontName as CFString,
                    kCTFontSizeAttribute: size
                ] as CFDictionary)
                return UIFont(descriptor: fontDescriptor, size: size)
            } else {
                if let error = error?.takeRetainedValue() {
                    print("Failed to register font: \(error)")
                } else {
                    print("Failed to register font with an unknown error")
                }
            }
        } else {
            print("Failed to load font data")
        }
        return UIFont()
    }
}

struct StyleGuide {
    let font: Font
    let lineHeight: CGFloat
    
    init(size: CGFloat, weight: SUITWeight = .regular, lineHeight: CGFloat) {
        self.font = .suit(size, weight: weight)
        self.lineHeight = lineHeight
    }
}

enum SUITWeight: String {
    case thin = "Thin"
    case extraLight = "ExtraLight"
    case light = "Light"
    case regular = "Regular"
    case medium = "Medium"
    case semiBold = "SemiBold"
    case bold = "Bold"
    case extraBold = "ExtraBold"
    case heavy = "Heavy"
}
