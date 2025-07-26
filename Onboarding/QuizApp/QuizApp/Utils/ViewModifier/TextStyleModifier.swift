//
//  TextStyleModifier.swift
//  QuizApp
//
//  Created by Coderbabu on 02/06/25.
//


import SwiftUI

struct TextStyleModifier: ViewModifier {
    var color: Color
    var textSize: CGFloat
    var fontWeight: Font.Weight?
    var customFont: CustomFont?
    var kern: CGFloat = 0
 
    func body(content: Content) -> some View {
        let font: Font = {
            if let customFont = customFont {
                return .custom(customFont.fontName, size: textSize)
            } else {
                return .system(size: textSize, weight: fontWeight ?? .regular)
            }
        }()
        
        return content
            .foregroundColor(color)
            .font(font)
            .kerning(kern)
    }
}
 
extension View {
    func textStyle(color: Color, textSize: CGFloat, fontWeight: Font.Weight? = .regular, customFont: CustomFont? = nil, kern: CGFloat = 0) -> some View {
        self.modifier(TextStyleModifier(color: color, textSize: textSize, fontWeight: fontWeight, customFont: customFont, kern: kern))
    }
}

