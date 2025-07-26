//
//  BackHeaderView.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//


import SwiftUI

struct BackHeaderView: View {
    @EnvironmentObject var router: Router
    var title: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    if let customAction = action {
                        customAction()
                    } else {
                        Haptic.shared.generate(.medium)
                        router.navigateBack()
                    }
                }) {
                    Image(ImageConstant.backIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Spacer()
            }

            if let title = title {
                Text(title)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 24,
                        customFont: .leagueSpartanMedium
                    )
            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}
