//
//  PersonModel.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct PersonModel {
    let name: String
    let role: String
    let image: String
    let quotes: [Quote]
}

struct Quote {
    let title: String
    let body: String
}
