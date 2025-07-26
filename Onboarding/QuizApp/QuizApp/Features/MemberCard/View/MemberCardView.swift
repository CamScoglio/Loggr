//
//  MemberCardView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

struct MemberCardView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        
        ZStack{
            Image(ImageConstant.memberCardBg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                
                Spacer()
                    .frame(height: 60)
                
                Text(StringConstant.membercardLetsGo)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 32,
                        customFont: .leagueSpartanSemiBold
                    )
                    .padding(.bottom,16)
                
                Text(StringConstant.membercardWelcomeMessage)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 17,
                        customFont: .leagueSpartanRegular
                    )
                    .padding(.bottom,33)
                
                MemberCard()
               
                Spacer()
                    .frame(height: 35)
                
                Text(StringConstant.membercardBuildAroundYou)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 16,
                        customFont: .leagueSpartanSemiBold
                    )
                
                Spacer()
                    .frame(height: 35)
                
                PrimaryButton(
                    title: StringConstant.next,
                    color: AnyView(ColorConstant.nextButtonBG)
                ) { 
                    router.navigateTo(.questionView)
                }
                .padding(.horizontal,22)
            }
        }
    }
}

#Preview {
    MemberCardView()
}
