//
//  SolutionView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct SolutionView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var currentIndex = 0
        
    var body: some View {
        
        ZStack{
            
            Image(ImageConstant.welcomeBackground)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                    .frame(height: 126)
                
                HStack{
                    
                    Spacer()
                    
                    Text(StringConstant.welcomeTitle)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 40,
                            customFont: .leagueSpartanSemiBold,kern: 7.7
                        )
                    Spacer()
                }   
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                    .frame(height: 79)
                
                HStack{
                 
                    Text("Welcome to")
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 38,
                            customFont: .leagueSpartanSemiBold
                        )
                  
                    Spacer()
                }   
                .padding(.horizontal)
                
                Spacer()
            }.opacity(currentIndex == 0 ? 1 : 0)
            
            VStack(spacing: 0){
                
                Spacer()
                
                Text(StringConstant.inspirationalTitle) 
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 18,
                        customFont: .leagueSpartanRegular
                    )
                 
                Spacer()
                    .frame(height: 60)
                
                TabView(selection: $currentIndex) {
                    ForEach(0..<ConstantList.solutionSlidesList.count, id: \.self) { index in
                        let slide = ConstantList.solutionSlidesList[index]
                        VStack(alignment: .center, spacing: 0) {
                            VStack(alignment: .center, spacing: 10) {
                                Text(slide.title)
                                    .textStyle(
                                        color: ColorConstant.textPrimaryClr,
                                        textSize: 24,
                                        customFont: .leagueSpartanBold
                                    )
                                Spacer()
                                    .frame(height: 8)
                                Text(.init(slide.subtitle)) 
                                    .textStyle(
                                        color: ColorConstant.textPrimaryClr,
                                        textSize: 18,
                                        customFont: .leagueSpartanRegular
                                    )
                                    .lineSpacing(2)
                                    .multilineTextAlignment(.center)
                            }
                           
                            HStack(spacing: 26){
                                Image(ImageConstant.dukeUniversitylogo)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 63,height: 25)
                                Image(ImageConstant.hubermanLabLogo)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 116,height: 61)
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 200) 
                
                Spacer()
                    .frame(height: 20)
                
                HStack(spacing: 3) {
                    ForEach(0..<ConstantList.solutionSlidesList.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? ColorConstant.lightGray : ColorConstant.lightGray.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                
                NextActionButton(action: { 
                    if currentIndex < ConstantList.solutionSlidesList.count - 1 {
                        withAnimation {
                            currentIndex += 1
                        }
                    } else {
                        router.navigateTo(.essentialsView)
                    }
                })
                .padding(.top, 18)
                
                Spacer()
                    .frame(height: 77)
            }
        }
        .overlay(alignment: .topTrailing){ 
            Image(ImageConstant.crossImageSolution)
                .resizable()
                .scaledToFit()
                .frame(height: 247)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SolutionView()
}
