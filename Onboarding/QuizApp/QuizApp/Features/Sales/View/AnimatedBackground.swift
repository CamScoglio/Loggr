//
//  AnimatedBackground.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//


import SwiftUI

struct AnimatedBackground: View {
    var body: some View {
        VStack(spacing: 5) {
            AnimatedCapsuleRow(capsuleCount: 8, direction: .left, speed: 15)
            AnimatedCapsuleRow(capsuleCount: 3, direction: .right, speed: 10)
            AnimatedCapsuleRow(capsuleCount: 8, direction: .left, speed: 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AnimatedCapsuleRow: View {
    let capsuleCount: Int
    let direction: AnimationDirection
    let speed: Double
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            let capsuleWidth: CGFloat = 177
            let totalWidth = capsuleWidth * CGFloat(capsuleCount)
            
            HStack(spacing: 10) {
                ForEach(0..<capsuleCount * 2, id: \.self) { index in
                    Capsule()
                        .fill(Color(red: 0.776, green: 0.216, blue: 0.043).opacity(0.5))
                        .frame(width: capsuleWidth, height: 24)
                        .overlay(
                            Capsule()
                                .stroke(Color.black.opacity(0.4), lineWidth: 1.5)
                        )
                }
            }
            .offset(x: offset)
            .onAppear {
                withAnimation(.linear(duration: speed).repeatForever(autoreverses: false)) {
                    offset = direction == .left ? -totalWidth : totalWidth
                }
            }
        }
        .frame(height: 32)
        
    }
}

enum AnimationDirection {
    case left
    case right
}
