//
//  PrimaryTextField.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//


import SwiftUI

struct PrimaryTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 72)
                .fill(ColorConstant.lightGray)
                .frame(height: 62)
            
            if isSecure {
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .textStyle(
                                color: ColorConstant.textSecondaryClr,
                                textSize: 17,
                                customFont: .leagueSpartanSemiBold
                            )
                    }

                    SecureField("", text: $text)
                        .keyboardType(keyboardType)
                        .accentColor(ColorConstant.textSecondaryClr)
                        .textStyle(
                            color: ColorConstant.textSecondaryClr,
                            textSize: 17,
                            customFont: .leagueSpartanSemiBold
                        )
                }
                .padding(.horizontal, 22)
            } else {
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .textStyle(
                                color: ColorConstant.textSecondaryClr,
                                textSize: 17,
                                customFont: .leagueSpartanSemiBold
                            )
                    }

                    TextField("", text: $text)
                        .keyboardType(keyboardType)
                        .accentColor(ColorConstant.textSecondaryClr)
                        .textStyle(
                            color: ColorConstant.textSecondaryClr,
                            textSize: 17,
                            customFont: .leagueSpartanSemiBold
                        )
                }
                .padding(.horizontal, 22)
            }
        }
    }
}
