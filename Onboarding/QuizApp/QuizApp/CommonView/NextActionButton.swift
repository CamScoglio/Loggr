//
//  NextActionButton.swift
//  QuizApp
//
//  Created by Coderbabu on 24/07/25.
//

import SwiftUI

struct NextActionButton: View {
       
    let action: () -> Void

    var body: some View {
        
        Rectangle()
            .fill(ColorConstant.lightGray)
            .frame(width: 137,height: 42)
            .cornerRadius(75)
            .overlay { 
                HStack{
                    Text(StringConstant.next)
                        .textStyle(
                            color: ColorConstant.textSecondaryClr,
                            textSize: 17,
                            customFont: .leagueSpartanSemiBold
                        )
                    
                    Spacer()
                    
                    Image(ImageConstant.nextIcon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(ColorConstant.black)
                        .frame(width: 20,height: 20)
                }
                .padding()
            }
            .onTapGesture {
                Haptic.shared.generate(.medium)
                action()
            }
        
     
    }
}
