//
//  File.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

extension Color {
    /// Create a Color from a hex string (e.g. "#9600AD")
    static func hex(_ hex: String) -> Color {
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hex.hasPrefix("#") {
            hex.removeFirst()
        }

        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)

        let r = Double((rgb & 0xFF0000) >> 16) / 255
        let g = Double((rgb & 0x00FF00) >> 8) / 255
        let b = Double(rgb & 0x0000FF) / 255

        return Color(red: r, green: g, blue: b)
    }
}
