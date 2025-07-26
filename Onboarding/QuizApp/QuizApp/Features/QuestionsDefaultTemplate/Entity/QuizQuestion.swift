//
//  QuizQuestion.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

struct QuizQuestion {
    let question: String
    let options: [String]
    let correctIndex: Int
}

let sampleQuestions: [QuizQuestion] = [
    QuizQuestion(
        question: StringConstant.quizQ1,
        options: [
            StringConstant.quizQ1Opt1,
            StringConstant.quizQ1Opt2,
            StringConstant.quizQ1Opt3,
            StringConstant.quizQ1Opt4
        ],
        correctIndex: 2 // "Paris"
    ),
    QuizQuestion(
        question: StringConstant.quizQ2,
        options: [
            StringConstant.quizQ2Opt1,
            StringConstant.quizQ2Opt2,
            StringConstant.quizQ2Opt3
        ],
        correctIndex: 2 // "Swift"
    ),
    QuizQuestion(
        question: StringConstant.quizQ3,
        options: [
            StringConstant.quizQ3Opt1,
            StringConstant.quizQ3Opt2,
            StringConstant.quizQ3Opt3,
            StringConstant.quizQ3Opt4
        ],
        correctIndex: 1 // "1945"
    )
]
