//
//  GoalCardView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct GoalCardView: View {
    
    let title: String
    let isSelected: Bool
    let color: Color
    let onTap: () -> Void
    
    var body: some View {
        
        HStack(spacing: 25) {
            Circle()
                .strokeBorder(ColorConstant.black, lineWidth: 1.5)
                .background(
                    Circle().fill(isSelected ? Color.black : Color.clear)
                )
                .frame(width: 34, height: 34)
            
            Text(title)
                .textStyle(
                    color: ColorConstant.textPrimaryClr,
                    textSize: 18,
                    customFont: .leagueSpartanSemiBold
                )
            
            Spacer()
        }
        .padding()
        .frame(height: 62)
        .background(color)
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
        .cornerRadius(40)
        .onTapGesture {
            onTap()
        }
    }
}
