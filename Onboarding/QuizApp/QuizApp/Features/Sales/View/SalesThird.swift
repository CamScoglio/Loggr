//
//  SalesThird.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//

import SwiftUI

struct SalesThird: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack { 
            
            EllipticalGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.82, green: 0.37, blue: 0.99), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.57, green: 0.19, blue: 0.7), location: 0.63),
                    Gradient.Stop(color: Color(red: 0.31, green: 0, blue: 0.42), location: 1.00),
                ],
                center: UnitPoint(x: 0.5, y: 0.14)
            )
            .edgesIgnoringSafeArea(.all)
            .overlay(alignment: .topTrailing){ 
                Image(ImageConstant.salesCross)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 247)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack{
                
                Spacer()
                    .frame(height: 60)
                
                Text(StringConstant.salesLockInText)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 48,
                        customFont: .leagueSpartanSemiBold,kern: 11.52
                    )
                
                Spacer()
                    .frame(height: 60)
                
                Text(StringConstant.salesUnlockTitle)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 32,
                        customFont: .leagueSpartanSemiBold
                    )
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                
                Text(StringConstant.salesFeaturesDescription)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 16,
                        customFont: .leagueSpartanExtraLight
                    )
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                    .padding(.vertical)
                
                Spacer()
                
                Image(ImageConstant.fiveStars)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130,height: 30)
                
                Spacer()
                    .frame(height: 16)
                
                Text(StringConstant.salesFocusedSelf)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 16,
                        customFont: .leagueSpartanLight
                    )
               
                Spacer()
                    .frame(height: 52)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 62)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.83, green: 0.01, blue: 0.99), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.89, green: 0.29, blue: 1), location: 0.31),
                                Gradient.Stop(color: Color(red: 0.47, green: 0.02, blue: 0.63), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0, y: 0.5),
                            endPoint: UnitPoint(x: 1, y: 0.5)
                        )
                    )
                    .cornerRadius(75)
                    .shadow(color: Color(red: 1, green: 0.98, blue: 0.01).opacity(0.76), radius: 21.1, x: 0, y: 2)
                    .overlay(content: { 
                        Text(StringConstant.salesLockInText)
                            .textStyle(
                                color: ColorConstant.textPrimaryClr,
                                textSize: 32,
                                customFont: .leagueSpartanSemiBold,
                                kern: 3.5
                            )
                            .shadow(
                                color: Color.black.opacity(0.25),
                                radius: 4,
                                x: 0,
                                y: 4
                            )
                    })
                    .onTapGesture {
                        Haptic.shared.generate(.medium)
                    }
                    .padding(.horizontal,23)
                
                Text(StringConstant.salesFocusedSelf)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 16,
                        customFont: .leagueSpartanLight
                    )
                    .padding(.vertical,10)
            }
            .background(alignment: .bottom){ 
                Image(ImageConstant.creditCard)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .offset(y: 70)
            }
        }
        .overlay(alignment: .top) {
            BackHeaderView()
        }        
    }
}

#Preview {
    SalesThird()
}
