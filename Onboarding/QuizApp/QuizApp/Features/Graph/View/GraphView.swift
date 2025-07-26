//
//  GraphView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct GraphView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            Image(ImageConstant.essentialsBg)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Image(ImageConstant.comparisonGraph)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                    .frame(height: 88)
                
                Text(StringConstant.graph_dec)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 18,
                        customFont: .leagueSpartanRegular
                    )
                    .multilineTextAlignment(.leading)
                
                Spacer()
                    
                
            }
            .padding(.horizontal,18)
            
            VStack{
                
                Spacer()
                
                PrimaryButton(
                    title: StringConstant.continueLabel,
                    color: AnyView(ColorConstant.nextButtonBG)
                ) { 
                    router.navigateTo(.chooseGoalView)
                }
                .padding(.horizontal,22)
                
            }
        }
        .overlay(alignment: .top){ 
            BackHeaderView(title: StringConstant.lOCK_IN_Essentials)
        }
    }
}

#Preview {
    GraphView()
}



