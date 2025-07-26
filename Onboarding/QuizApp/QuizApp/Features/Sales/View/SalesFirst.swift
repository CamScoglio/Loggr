//
//  SalesFirst.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//

import SwiftUI

struct SalesFirst: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack{
            
            Image(ImageConstant.welcomeBackground)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                    .frame(height: 80)
                
                Text(StringConstant.salesDec)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 24,
                        customFont: .leagueSpartanSemiBold
                    )
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                    .frame(height: 80)
                
                MemberCard()
                
              
                Spacer()
                
                PrimaryButton(
                    title: StringConstant.next,
                    color: AnyView(ColorConstant.nextButtonBG)
                ) { 
                    router.navigateTo(.salesSecondView)
                }
                .padding(.horizontal,22)
            }
        }
        .overlay(alignment: .top) {
            BackHeaderView()
        }
    }
}

#Preview {
    SalesFirst()
}


