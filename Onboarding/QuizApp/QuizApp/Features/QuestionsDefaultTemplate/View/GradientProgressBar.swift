//
//  GradientProgressBar.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//


import SwiftUI

struct GradientProgressBar: View {
    
    var progress: CGFloat // Between 0.0 and 1.0

    var body: some View {
        ZStack(alignment: .leading) {
            // Background container
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color.gray.opacity(0.5), lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.clear)
                )
                .frame(height: 10)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: 1)

            // Progress fill
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.6), Color.white.opacity(0.7)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: progressBarWidth(progress: progress), height: 10)
        }
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

        .padding(.horizontal,20)
    }

    private func progressBarWidth(progress: CGFloat) -> CGFloat {
        // Use UIScreen width or define fixed width
        let totalWidth = UIScreen.main.bounds.width - 32 
        return max(0, min(progress, 1)) * totalWidth
    }
}
