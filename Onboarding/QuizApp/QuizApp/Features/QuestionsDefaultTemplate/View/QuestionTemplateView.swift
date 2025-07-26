//
//  QuestionTemplateView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI


struct QuestionTemplateView: View {
    
    @EnvironmentObject var router: Router

    let questions: [QuizQuestion] = sampleQuestions

    @State private var currentQuestionIndex = 0
    @State private var selectedIndex: Int? = nil
    @State private var answeredCount = 0 // 👈 New state

    var body: some View {
        let currentQuestion = questions[currentQuestionIndex]

        ZStack {
            
            Image(ImageConstant.questionTempBg)
                .resizable()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button(action: {
                        if currentQuestionIndex > 0 {
                            currentQuestionIndex -= 1
                            selectedIndex = nil
                            answeredCount = max(answeredCount - 1, 0) // 👈 Decrease when going back
                        } else {
                            router.navigateBack()
                        }
                    }) {
                        Image(ImageConstant.backIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    Spacer()

                    GradientProgressBar(progress: progressValue)
                        .frame(height: 10)

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)

                // Title
                Text(
                    "\(StringConstant.questionTitle)\(currentQuestionIndex + 1)"
                )
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 32,
                        customFont: .leagueSpartanSemiBold
                    )
                    .padding(.vertical, 33)

                // Question
                Text(currentQuestion.question)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 18,
                        customFont: .leagueSpartanRegular
                    )
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                Spacer().frame(height: 100)

                // Options
                OptionsListView(
                    options: currentQuestion.options,
                    selectedIndex: selectedIndex,
                    onOptionSelected: { index in
                        Haptic.shared.generate(.medium)
                        selectedIndex = index
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            goToNextQuestion()
                        }
                    }
                )
                .padding(.horizontal, 24)

                Spacer()
            }
        }
     
        .onAppear {
            // Sync answeredCount with current question index when coming back
            answeredCount = currentQuestionIndex
        }
    }

    // 👇 Use answeredCount for progress instead of question index
    private var progressValue: CGFloat {
        return CGFloat(answeredCount) / CGFloat(questions.count)
    }

    private func goToNextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            answeredCount += 1  // ✅ Moved here
            currentQuestionIndex += 1
            selectedIndex = nil
        } else {
            // ✅ Only increment for the last answer before navigating
            answeredCount += 1
            router.navigateTo(.calculationView)
        }
    }
}

#Preview {
    QuestionTemplateView()
}


