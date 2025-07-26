//
//  SplashView.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

struct SplashView: View {

    var body: some View {
        ZStack{
            Image(ImageConstant.welcomeBackground)
                .resizable()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

// SwiftUI preview
#Preview {
    SplashView()
}

