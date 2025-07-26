//
//  MemberCard.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//

import SwiftUI

struct MemberCard : View {
    
    var body: some View {
        ZStack{
            
            Image(ImageConstant.card)
                .resizable()
            
            VStack {
                
                Spacer()
                
                Rectangle()
                    .fill(ColorConstant.black.opacity(0.78))
                    .frame(height: 80)
                    .overlay(alignment: .trailing){ 
                        VStack(alignment: .trailing,spacing: 10){
                            Text(StringConstant.membercardWorkedDailySince)
                                .fontWeight(.semibold)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 15
                                )
                            Text("23 july")
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 15,
                                    customFont: .leagueSpartanRegular
                                )
                        }
                        .padding()
                        .padding(.bottom)
                    }
            }
            
            HStack{
                VStack(alignment: .leading,spacing: 20){
                    
                    Spacer()
                        .frame(height: 100)
                    
                    Text(StringConstant.membercardDailyAverageTime)
                    
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 15
                        )
                        .lineSpacing(5)
                    
                    Text("0 \(StringConstant.membercardHours)")
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 24,
                            customFont: .leagueSpartanSemiBold
                        )
                    
                    Spacer()
                        .frame(height: 30)
                        
                }
                
                Spacer()
            }
            .padding()
            
            
            
            VStack {
                HStack{
                    Image(ImageConstant.lockedBadge)
                        .resizable()
                        .frame(width: 33,height: 33)
                    Spacer()
                }  
                Spacer()
               
            }
            .padding(26)
           
        }  
        .frame(height: 384)
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.5), radius: 16.1, x: 0, y: 4)
        .padding(.horizontal,40)

    }
}
