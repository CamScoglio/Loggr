//
//  SalesSecond.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//


import SwiftUI

struct SalesSecond: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack{
            
            Image(ImageConstant.welcomeBackground)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                    .frame(height: 125)
                
                HStack{
                    
                    Spacer()
                    
                    Image(ImageConstant.circleCheck)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45,height: 45)
                    
                    Spacer()
                }   
                
                Text(StringConstant.salesNamePlanTitle)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 24,
                        customFont: .leagueSpartanSemiBold
                    )
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Text(StringConstant.salesProductivityDescription)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 20,
                        customFont: .leagueSpartanRegular
                    )
                    .multilineTextAlignment(.center)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 137, height: 42)
                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                  .cornerRadius(150)
                  .overlay { 
                      Text(StringConstant.salesDateTag)
                          .textStyle(
                            color: ColorConstant.textSecondaryClr,
                              textSize: 16,
                            customFont: .leagueSpartanSemiBold
                          )
                  }
                  .padding(.vertical,25)
                
                Image(ImageConstant.fiveStars)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130,height: 30)
                    .padding(.bottom,15)
                
                Text(StringConstant.salesHeadline)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 24,
                      customFont: .leagueSpartanSemiBold
                    )
                    .padding(.bottom,2)
                
                Text(StringConstant.salesSubheadline)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 16,
                        customFont: .leagueSpartanLight
                    )
                    .padding(.bottom)
                
                AnimatedBackground()
                
                Spacer()
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 62)
                    .background(
                        LinearGradient(
                            stops: [
                                .init(color: Color(red: 0.83, green: 0.01, blue: 0.99), location: 0.00),
                                .init(color: Color(red: 0.89, green: 0.29, blue: 1), location: 0.31),
                                .init(color: Color(red: 0.58, green: 0.93, blue: 0.87), location: 0.50),
                                .init(color: Color(red: 0.67, green: 1, blue: 0.74), location: 1.00),
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(75)
                    .shadow(
                        color: Color(red: 1.0, green: 0.984, blue: 0.0078).opacity(0.25),
                        radius: 59,
                        x: 0,
                        y: 4
                    )
                    .overlay(
                        Text(StringConstant.salesLockInText)
                            .textStyle(
                                color: ColorConstant.textSecondaryClr,
                                textSize: 30,
                                customFont: .leagueSpartanSemiBold,
                                kern: 3.5
                            )
                    )
                    .padding(.horizontal, 30)
                    .onTapGesture {
                        Haptic.shared.generate(.medium)
                        router.navigateTo(.salesThirdView)
                    }
            }
        }
        .overlay(alignment: .topTrailing){ 
            Image(ImageConstant.crossImageSolution)
                .resizable()
                .scaledToFit()
                .frame(height: 247)
                .edgesIgnoringSafeArea(.all)
        }
        
        .overlay(alignment: .top) {
            BackHeaderView()
        }
        
       
    }
}

#Preview {
    SalesSecond()
}




