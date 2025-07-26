//
//  ReviewCard.swift
//  QuizApp
//
//  Created by Coderbabu on 25/07/25.
//


import SwiftUI

struct ReviewCard: View {
    
    let reviewModel: ReviewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10){
                Image(reviewModel.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                
                Text(reviewModel.name)
                    .textStyle(
                        color: ColorConstant.textSecondaryClr,
                        textSize: 22,
                        customFont: .leagueSpartanMedium
                    )
                
                Spacer()
                
                Image(ImageConstant.fiveStars)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 20)
            }
            
            Text("“\(reviewModel.message)”")
                .textStyle(
                    color: ColorConstant.textSecondaryClr,
                    textSize: 14,
                    customFont: .leagueSpartanRegular
                )
                .lineSpacing(2)
                .padding(.horizontal,25)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .padding(.bottom)
        .background(Color(red: 0.86, green: 0.86, blue: 0.86))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 0.56, green: 0.56, blue: 0.56), lineWidth: 2)
        )
        
    }
}
