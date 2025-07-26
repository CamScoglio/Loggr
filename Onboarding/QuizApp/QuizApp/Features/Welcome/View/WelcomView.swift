//
//  WelcomView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

struct WelcomView: View {

    @EnvironmentObject var router: Router

    var body: some View {
        ZStack {
            backgroundView

            VStack(alignment: .leading) {
                Spacer().frame(height: 20)

                headerView

                Spacer()
                Spacer()

                contentSection

                Spacer()

                startQuizSection
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }

    // MARK: - Background

    private var backgroundView: some View {
        Image(ImageConstant.welcomeBackground)
            .resizable()
            .ignoresSafeArea()
    }

    // MARK: - Header Title

    private var headerView: some View {
        HStack {
            Spacer()
            Text(StringConstant.welcomeTitle)
                .textStyle(
                    color: ColorConstant.textPrimaryClr,
                    textSize: 40,
                    customFont: .leagueSpartanSemiBold,
                    kern: 7.7
                )
            Spacer()
        }
    }

    // MARK: - Description Section

    @ViewBuilder
    private var contentSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(StringConstant.welcomeSubtitle)
                .textStyle(
                    color: ColorConstant.textPrimaryClr,
                    textSize: 36,
                    customFont: .leagueSpartanSemiBold
                )

            Text(StringConstant.welcomeDescription)
                .textStyle(
                    color: ColorConstant.textPrimaryClr,
                    textSize: 19,
                    customFont: .leagueSpartanSemiBold
                )
                .lineSpacing(5)

            Image(ImageConstant.startRating)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 19)
                .offset(x: -10)
        }
        .padding(.horizontal, 22)
    }

    // MARK: - Button Section

    @ViewBuilder
    private var startQuizSection: some View {
        ZStack(alignment: .top) {
            HStack {
                Image(ImageConstant.crossImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)
                Spacer()
            }

            HStack {
                Spacer()
                Rectangle()
                    .fill(ColorConstant.lightGray)
                    .frame(width: 137, height: 42)
                    .cornerRadius(75)
                    .overlay {
                        HStack {
                            Text(StringConstant.welcomeButtonStartQuiz)
                                .textStyle(
                                    color: ColorConstant.textSecondaryClr,
                                    textSize: 18,
                                    customFont: .leagueSpartanSemiBold
                                )
                            Circle()
                                .frame(width: 25, height: 25)
                        }
                    }
                    .onTapGesture {
                        Haptic.shared.generate(.medium)
                        router.navigateTo(.logInView)
                    }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    WelcomView()
}
