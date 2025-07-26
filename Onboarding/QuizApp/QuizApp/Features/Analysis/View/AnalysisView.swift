//
//  AnalysisView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

struct AnalysisView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack{
            ColorConstant.analysisViewBg
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                
                Spacer()
                    .frame(height: 95)
                VStack(alignment: .center,spacing: 16){
                    HStack{
                        
                        Text(StringConstant.analysisTitle)
                            .textStyle(
                                color: ColorConstant.textPrimaryClr,
                                textSize: 32,
                                customFont: .leagueSpartanMedium
                            )
                        Image(ImageConstant.verifyBadge)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26,height: 26)
                        
                    }
                    
                    Text(StringConstant.analysisSubtitle)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 17,
                            customFont: .leagueSpartanLight
                        )
                    
                    Text(StringConstant.analysisResultDescription)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 18,
                            customFont: .leagueSpartanRegular
                        ) 
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                VStack{
                    HStack(alignment: .bottom,spacing: 50){
                        
                        VStack(spacing: 10) {
                            Rectangle()
                                .fill(ColorConstant.red)
                                .frame(width: 70, height: 266)
                                .cornerRadius(6)
                                .overlay(alignment: .top) {
                                    VStack(spacing: 1){
                                        Text(
                                            StringConstant.analysisScreenTimeOver2
                                        )
                                        Text(StringConstant.analysisHours)
                                    }
                                    .textStyle(
                                        color: ColorConstant.textPrimaryClr,
                                        textSize: 16,
                                        customFont: .leagueSpartanSemiBold
                                    )
                                    
                                    .padding(.top, 10)
                                }
                            
                            Text(StringConstant.analysisDailyScreenTime)
                                .multilineTextAlignment(.center)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 16,
                                    customFont: .leagueSpartanRegular
                                )
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        VStack(spacing: 10) {
                            Rectangle()
                                .fill(ColorConstant.emeraldGreen)
                                .frame(width: 70,height: 131)
                                .cornerRadius(6)
                                .overlay(alignment: .top){ 
                                    VStack(spacing: 1){
                                        Text(StringConstant.screenTimeUnder30)
                                        Text(StringConstant.analysisMinutes)
                                    }
                                    .textStyle(
                                        color: ColorConstant.textPrimaryClr,
                                        textSize: 16,
                                        customFont: .leagueSpartanSemiBold
                                    )
                                    .padding(.top,10)
                                }
                            
                            Text(StringConstant.analysisAverage)
                                .multilineTextAlignment(.center)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 16,
                                    customFont: .leagueSpartanRegular
                                )
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    
                }
                
                
                Spacer()
                
                HStack{
                    Text(StringConstant.analysisMultiplier)
                        .foregroundColor(ColorConstant.red)
                    
                    Text(StringConstant.analysisComparison)
                        .underline()
                    
                    Text(StringConstant.analysisAddiction)
                        .foregroundColor(ColorConstant.red)
                    
                    Text(StringConstant.analysisSocialMediaReference)
                    
                    Image(ImageConstant.analysisIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)
                }
                .textStyle(
                    color: ColorConstant.textPrimaryClr,
                    textSize: 16,
                    customFont: .leagueSpartanBold
                )
                .padding(.bottom,12)
                
                Text(StringConstant.analysisDisclaimer)
                    .textStyle(
                        color: ColorConstant.textPrimaryClr,
                        textSize: 8,
                        customFont: .leagueSpartanThin
                    )
                    .padding(.bottom,10)
                
                
                PrimaryButton(
                    title: StringConstant.analysisCheckSymptoms,
                    color: AnyView(ColorConstant.checksymptomsButton)) { 
                        router.navigateTo(.symptomsView)
                    }
                    .padding(.horizontal,22)
            }
        }
        .overlay(alignment: .top){ 
            BackHeaderView()
        }
    }
}

#Preview {
    AnalysisView()
}
