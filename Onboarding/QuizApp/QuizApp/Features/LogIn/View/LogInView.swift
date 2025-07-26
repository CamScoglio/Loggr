//
//  LogInView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var email = ""
    @State private var phone = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            
            Image(ImageConstant.loginBg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                    .frame(height: 50)
                
                HStack{
                    Spacer()
                    Text(StringConstant.loginTitle)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 48,
                            customFont: .leagueSpartanSemiBold,kern: 7.7
                        )
                    Spacer()
                }
                
                Spacer()
            }
            
            VStack(spacing: 12){
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    Text(StringConstant.loginTitle)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 38,
                            customFont: .leagueSpartanSemiBold
                        )
                    
                    Spacer()
                }
                
                Text(StringConstant.loginSubtitle)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 14,
                        customFont: .leagueSpartanSemiBold
                    )
                
                Spacer()
                    .frame(height: 20)
            
                PrimaryTextField(placeholder: StringConstant.loginEmailPlaceholder, text: $email)
                
                PrimaryTextField(
                    placeholder: StringConstant.loginPhonePlaceholder,
                    text: $phone,
                    keyboardType: .numberPad
                )
                
                PrimaryTextField(
                    placeholder: StringConstant.loginPasswordPlaceholder,
                    text: $password,
                    isSecure: true
                )
                
                PrimaryButton(
                    title: StringConstant.loginButtonSignIn,
                    color: AnyView(ColorConstant.signInButtonColor)
                ) {
                    router.navigateTo(.memberCardView)
                }
                
                HStack(spacing: 3){
                    Text(StringConstant.loginNoAccount)
                    Text(StringConstant.loginSignUp)
                        .foregroundColor(ColorConstant.electricPurple)
                }
                .padding(.bottom)
                .textStyle(
                    color: ColorConstant.textPrimaryClr,
                    textSize: 12,
                    customFont: .leagueSpartanSemiBold
                )
            }
            .padding(.horizontal,22)
            .edgesIgnoringSafeArea(.bottom)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    LogInView()
}

