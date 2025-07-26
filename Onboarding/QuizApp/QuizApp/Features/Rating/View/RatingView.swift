//
//  RatingView.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//

import SwiftUI

struct RatingView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        
        ZStack {
            
            Image(ImageConstant.ratingBg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                    .frame(height: 65)
                
                ScrollView(showsIndicators: false){ 
                    
                    Text(StringConstant.giveUsRating)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 32,
                            customFont: .leagueSpartanMedium
                        )
                    
                    Spacer()
                        .frame(height: 40)
                    
                    
                    Image(ImageConstant.fiveStars)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 30)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Text(StringConstant.appDescription)
                        .textStyle(
                            color: ColorConstant.textPrimaryClr,
                            textSize: 20,
                            customFont: .leagueSpartanRegular
                        )
                        .multilineTextAlignment(.center)
                    
                    
                    Spacer()
                        .frame(height: 40)
                    
                    
                    HStack(spacing: 16){
                        
                        
                        HStack(spacing: -10){
                            Image(ImageConstant.review1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30,height: 30)
                            Image(ImageConstant.review2)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30,height: 30)
                            Image(ImageConstant.review3)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30,height: 30)
                        }
                        
                        Text(StringConstant.usersCount)
                            .textStyle(
                                color: ColorConstant.textPrimaryClr,
                                textSize: 20,
                                customFont: .leagueSpartanRegular
                            )
                            .opacity(0.84)
                        
                    }
                    
                    Spacer()
                        .frame(height: 56)
                    
                    VStack(spacing: 20) {
                        ForEach(ConstantList.reviewsList) { review in
                            ReviewCard(reviewModel: review)
                                .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                        .frame(height: 100)
                }
                
            }
            
            VStack{
                
                Spacer()
                
                PrimaryButton(
                    title: StringConstant.next,
                    color: AnyView(ColorConstant.white),forGroundColor: ColorConstant.textSecondaryClr) { 
                        router.navigateTo(.educateView)
                    }
            }
            .padding(.horizontal,27)
            .background { 
                
                VStack{
                    Spacer()
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.2), Color.black.opacity(0.3)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 150)
                    .allowsHitTesting(false)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        
        .overlay(alignment: .top) {
            BackHeaderView()
        }
    }
}

#Preview {
    RatingView()
}


