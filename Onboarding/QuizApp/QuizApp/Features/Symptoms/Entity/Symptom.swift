    //
//  Symptom.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct Symptom: Identifiable {
    let id = UUID()
    let text: String
    let type: SymptomType
    var isSelected: Bool = false
}

enum SymptomType {
    case mental
    case physical
}
