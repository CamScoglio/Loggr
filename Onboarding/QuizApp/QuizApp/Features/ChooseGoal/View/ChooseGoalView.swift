//
//  ChooseGoalView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//


import SwiftUI

struct ChooseGoalView: View {
    
    @EnvironmentObject var router: Router
    
    @State var goalsList: [Goal] = [
        Goal(
            title: StringConstant.goalImproveFocus,
            color: Color.hex("#0B2AC6").opacity(0.56)
        ),
        Goal(title: StringConstant.goalImprovedSelfConfidence, color: Color.hex("#1B5600").opacity(0.86)),
        Goal(title: StringConstant.goalMoreEnergy, color: Color.hex("#C6C00B").opacity(0.5)),
        Goal(title: StringConstant.goalSelfControl, color: Color.hex("#C6370B").opacity(0.5)),
        Goal(title: StringConstant.goalMentalClarity, color: Color.hex("#C60B0B").opacity(0.5)),
        Goal(title: StringConstant.goalSuccessfulProjects, color: Color.hex("#940BC6").opacity(0.5)),
        Goal(title: StringConstant.goalEnjoymentWorkLife, color: Color.hex("#0B62C6").opacity(0.5))
    ]
    
    var body: some View {
        ZStack{
            
            Image(ImageConstant.questionTempBg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                Spacer()
                    .frame(height: 60)
                
                ZStack {
                    ScrollView(showsIndicators: false) {
                        
                        Spacer()
                            .frame(height: 30)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(StringConstant.chooseGoalsDescription)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 18,
                                    customFont: .leagueSpartanRegular
                                )
                            
                            Spacer().frame(height: 45)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                ForEach(
                                    goalsList.indices,
                                    id: \.self
                                ) { index in
                                    GoalCardView(
                                        title: goalsList[index].title,
                                        isSelected: goalsList[index].isSelected,
                                        color: goalsList[index].color
                                    ) {
                                        Haptic.shared.generate(.medium)
                                        goalsList[index].isSelected.toggle()
                                    }
                                }
                            }
                        }
                        
                        Spacer().frame(height: 120)
                    }
                }
            }
            .padding(.horizontal,27)
            
            VStack{
                
                Spacer()
                
                PrimaryButton(
                    title: StringConstant.trackGoalsButtonTitle,
                    color: AnyView(ColorConstant.white),forGroundColor: ColorConstant.textSecondaryClr) { 
                        router.navigateTo(.salesFirstView)
                    }
            }
            .padding(.horizontal,27)
            .background { 
                VStack{
                    Spacer()
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.2), Color.black.opacity(0.4)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 150)
                    .allowsHitTesting(false)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            
        }
        .overlay(alignment: .top){ 
            BackHeaderView(title: StringConstant.chooseGoalsTitle)
        }
    }
}

#Preview {
    ChooseGoalView()
}

