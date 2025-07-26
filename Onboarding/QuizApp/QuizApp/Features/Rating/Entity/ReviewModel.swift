//
//  ReviewModel.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//


import SwiftUI

struct ReviewModel: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let rating: Int
    let message: String
}

