//
//  Goal.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct Goal: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    var isSelected: Bool = false
}


