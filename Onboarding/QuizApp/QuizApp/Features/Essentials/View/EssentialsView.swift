//
//  SolutionView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct EssentialsView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            Image(ImageConstant.essentialsBg)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // Header
                Spacer()
                    .frame(height: 60)
                
                ScrollView(showsIndicators: false){
                    VStack(spacing: 24) {
                        ForEach(ConstantList.people, id: \.name) { person in
                            TestimonialCardView(person: person)
                        }
                    }
                    .padding(.horizontal,30)
                    .padding(.top, 14)
                    
                    Spacer()
                        .frame(height: 100)
                }
                
            }
            
            VStack{
                Spacer()
                
                PrimaryButton(
                    title: StringConstant.continueLabel,
                    color: AnyView(ColorConstant.nextButtonBG)
                ) { 
                    router.navigateTo(.graphView)
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
    EssentialsView()
}

