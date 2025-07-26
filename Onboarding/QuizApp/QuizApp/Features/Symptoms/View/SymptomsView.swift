//
//  SymptomsView.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct SymptomsView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var symptoms: [Symptom] = [
        Symptom(text: StringConstant.symptomAnxiety, type: .mental),
        Symptom(text: StringConstant.symptomLowSelfEsteem, type: .mental),
        Symptom(text: StringConstant.symptomInsomnia, type: .mental),
        Symptom(text: StringConstant.symptomEyeStrain, type: .physical),
        Symptom(text: StringConstant.symptomNeckPain, type: .physical)
    ]
    
    var mentalSymptoms: [Binding<Symptom>] {
        $symptoms.filter { $0.wrappedValue.type == .mental }
    }
    
    var physicalSymptoms: [Binding<Symptom>] {
        $symptoms.filter { $0.wrappedValue.type == .physical }
    }
    
    var body: some View {
        ZStack{
            
            Image(ImageConstant.questionTempBg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                Spacer()
                    .frame(height: 80)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 72)
                    .background(ColorConstant.red)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .overlay(content: { 
                        Text(StringConstant.warningMessage)
                            .textStyle(
                                color: ColorConstant.textPrimaryClr,
                                textSize: 17,
                                customFont: .leagueSpartanRegular
                            )
                            .padding(.horizontal)
                    })
                
                ZStack {
                    ScrollView(showsIndicators: false) {
                        Spacer().frame(height: 67)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(StringConstant.instruction)
                                .textStyle(
                                    color: ColorConstant.textPrimaryClr,
                                    textSize: 18,
                                    customFont: .leagueSpartanRegular
                                )
                            
                            Spacer().frame(height: 45)

                            VStack(alignment: .leading, spacing: 20) {
                                Group {
                                    Text(StringConstant.mentalCategory)
                                        .textStyle(
                                            color: ColorConstant.textPrimaryClr,
                                            textSize: 18,
                                            customFont: .leagueSpartanSemiBold
                                        )
                                    
                                    ForEach(mentalSymptoms) { $symptom in
                                        SymptomRow(symptom: $symptom)
                                    }
                                }

                                Group {
                                    Text(StringConstant.physicalCategory)
                                        .textStyle(
                                            color: ColorConstant.textPrimaryClr,
                                            textSize: 18,
                                            customFont: .leagueSpartanSemiBold
                                        )
                                    
                                    ForEach(physicalSymptoms) { $symptom in
                                        SymptomRow(symptom: $symptom)
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
                    title: StringConstant.rebootButtonTitle,
                    color: AnyView(ColorConstant.red)) { 
                        router.navigateTo(.educateView)
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
            BackHeaderView(title: StringConstant.symptomsTitle)
        }
    }
}

#Preview {
    SymptomsView()
}

