//
//  SymptomRow.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct SymptomRow: View {
    @Binding var symptom: Symptom
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: 62)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.58, green: 0.04, blue: 0.78), location: 0.10),
                        Gradient.Stop(color: Color(red: 0.53, green: 0.01, blue: 0.72), location: 0.97),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(72)
            .overlay(
                RoundedRectangle(cornerRadius: 75)
                    .stroke(
                        LinearGradient(
                            colors: [Color.black, .gray.opacity(0.5), .gray.opacity(0.7)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
            .overlay {
                HStack {
                    Circle()
                        .strokeBorder(
                            ColorConstant.black,
                            lineWidth: 1.5  
                        )
                        .background(
                            Circle()
                                .fill(symptom.isSelected ? ColorConstant.black : Color.clear)
                        )
                        .frame(width: 34, height: 34)
                    
                    Text(symptom.text)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 16,
                            customFont: .leagueSpartanRegular
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(2)
                }
                .padding(.horizontal, 16)
            }
            .onTapGesture {
                Haptic.shared.generate(.medium)
                symptom.isSelected.toggle()
            }
    }
}
