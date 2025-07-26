//
//  PrimaryButton.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//


import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var color: AnyView
    var forGroundColor: Color = ColorConstant.textPrimaryClr
    var action: () -> Void
   
    var body: some View {
        HStack {
            Text(title)
                .textStyle(
                    color: forGroundColor,
                    textSize: 17,
                    customFont: .leagueSpartanSemiBold
                )
            Spacer()
            Image(ImageConstant.nextIcon)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundStyle(forGroundColor)
                .frame(width: 20, height: 20)
        }
        .padding(.horizontal, 22)
        .frame(height: 62)
        .background(AnyView(color))
        .cornerRadius(72)
        .onTapGesture {
            Haptic.shared.generate(.medium)
            action()
        }
    }
}
