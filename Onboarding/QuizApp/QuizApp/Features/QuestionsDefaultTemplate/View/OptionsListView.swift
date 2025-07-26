//
//  OptionsListView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

struct OptionsListView: View {
    let options: [String]
    let selectedIndex: Int?
    let onOptionSelected: (_ index: Int) -> Void

    var body: some View {
        VStack(spacing: 16) {
            ForEach(options.indices, id: \.self) { index in
                OptionView(
                    optionIndex: index + 1,
                    optionText: options[index],
                    isSelected: selectedIndex == index,
                    onTap: {
                        onOptionSelected(index)
                    }
                )
            }
        }
    }
}

struct OptionView: View {
    var optionIndex: Int
    var optionText: String
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: 62)
            .background(
                LinearGradient(
                    stops: [
                        Gradient
                            .Stop(
                                color: ColorConstant.violetPurple,
                                location: 0.10
                            ),
                        Gradient
                            .Stop(
                                color: ColorConstant.deepPurple,
                                location: 0.97
                            ),
                    ],
                    startPoint: UnitPoint(x: 0, y: 0.5),
                    endPoint: UnitPoint(x: 1, y: 0.5)
                )
            )
            .cornerRadius(72)
            .overlay(
                RoundedRectangle(cornerRadius: 75)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    ColorConstant.black,
                                    .gray.opacity(0.5),
                                    .gray.opacity(0.7)
                                ]
                            ),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
            .overlay {
                HStack {
                    Circle()
                        .frame(width: 34, height: 34)
                        .overlay {
                            Text("\(optionIndex)")
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 16,
                                    customFont: .leagueSpartanSemiBold
                                )
                        }

                    Text(optionText)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 16,
                            customFont: .leagueSpartanRegular
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(2)

                        Image(ImageConstant.nextQuestion)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                }
                .padding(.horizontal, 16)
            }
            .onTapGesture {
                onTap()
            }
    }
}
