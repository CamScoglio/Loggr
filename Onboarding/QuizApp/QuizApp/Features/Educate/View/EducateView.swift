//
//  EducateView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct EducateView: View {
    
    @EnvironmentObject var router: Router

    @State private var currentIndex = 0
    
    @ViewBuilder
    func backgroundView(for color: Any) -> some View {
        if let linear = color as? LinearGradient {
            linear
        } else if let solid = color as? Color {
            solid
        } else {
            Color.black // fallback
        }
    }

    var body: some View {
        
        ZStack{
            
            ConstantList.educateSlidesList[currentIndex].background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                TabView(selection: $currentIndex) {
                    ForEach(0..<ConstantList.educateSlidesList.count, id: \.self) { index in
                        let slide = ConstantList.educateSlidesList[index]
                        VStack(alignment: .center, spacing: 10) {
                            Text(slide.title)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 24,
                                    customFont: .leagueSpartanBold
                                )
                            Spacer()
                                .frame(height: 26)
                            Text(.init(slide.subtitle)) 
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 18,
                                    customFont: .leagueSpartanRegular
                                )
                                .lineSpacing(2)
                                .multilineTextAlignment(.center)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 170)

                Spacer()
                    .frame(height: 40)
              
                HStack(spacing: 3) {
                    ForEach(0..<ConstantList.educateSlidesList.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? ColorConstant.lightGray : ColorConstant.lightGray.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                
                NextActionButton(action: {
                    if currentIndex < ConstantList.educateSlidesList.count - 1 {
                        withAnimation {
                            currentIndex += 1
                        }
                    } else {
                        router.navigateTo(.solutionView)
                    }
                })
                .padding(.top,18)
                
                Spacer()
                    .frame(height: 106)
            }
            .padding(.horizontal)
          
        }
    }
}

#Preview {
    EducateView()
}

