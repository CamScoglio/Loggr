//
//  Slide.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct Slide: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    let background: AnyView

    static func == (lhs: Slide, rhs: Slide) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.subtitle == rhs.subtitle
    }
}
