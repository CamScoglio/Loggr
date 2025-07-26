//
//  TestimonialCardView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//


import SwiftUI

struct TestimonialCardView: View {
    let person: PersonModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Avatar + name
            HStack(alignment: .top) {
                if !person.image.isEmpty {
                    Image(person.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading,spacing: 0){
                    ForEach(person.quotes.indices, id: \.self) { idx in
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(person.name)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 16,
                                    customFont: .leagueSpartanSemiBold
                                )
                            
                            if !person.role.isEmpty {
                                Text(person.role)
                                    .textStyle(
                                        color: ColorConstant.textPrimaryClr,
                                        textSize: 12,
                                        customFont: .leagueSpartanRegular
                                    )
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text(person.quotes[idx].title)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 12,
                                    customFont: .leagueSpartanSemiBold
                                )
                            Text(person.quotes[idx].body)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 12,
                                    customFont: .leagueSpartanRegular
                                )   
                        }
                        .padding()
                        .background(ColorConstant.commentBg)
                        .cornerRadius(10, corners: [.bottomRight,.bottomLeft,.topRight])
                        .padding(.top, 4)
                    } 
                }
            }
        }
    }
}
