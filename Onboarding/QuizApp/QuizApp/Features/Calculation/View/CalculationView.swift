//
//  CalculationView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//


import SwiftUI

struct CalculationView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var progress: CGFloat = 0.0

    @State private var hasNavigated = false
    
    var body: some View {
        
        ZStack {
            
            Image(ImageConstant.questionTempBg)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                
                ZStack {
                    // Base Circle
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 20)

                    // Progress Ring
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(
                            RadialGradient(
                                gradient: Gradient(
                                    colors: [
                                        ColorConstant.lightPink,
                                        Color.white
                                    ]
                                ),
                                center: .center,
                                startRadius: 10,
                                endRadius: 300
                            ),
                            style: StrokeStyle(lineWidth: 20, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 2), value: progress)

                    // Percentage Text
                    Text("\(Int(progress * 100))%")
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 46,
                            customFont: .leagueSpartanSemiBold
                        )
                }
                .frame(width: 160, height: 160)

               
                VStack(spacing: 16){
                    Text(StringConstant.calculatingTitle)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 36,
                            customFont: .leagueSpartanMedium
                        )

                    Text(StringConstant.understandingTitle)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 18,
                            customFont: .leagueSpartanLight
                        )
                    
                  
                }
            }
        }
        .overlay(alignment: .top){ 
            BackHeaderView()
        }
        .onAppear {
            guard !hasNavigated else { return }

            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if self.progress < 1.0 {
                    self.progress += 0.01
                } else {
                    timer.invalidate()
                    Haptic.shared.generate(.medium)
                    hasNavigated = true

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        router.navigateTo(.analysisView)
                    }
                }
            }
        }
    }
}

#Preview {
    CalculationView()
}
