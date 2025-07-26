//
//  Router.swift
//  QuizApp
//
//  Created by Coderbabu on 20/06/25.
//


import Foundation
import SwiftUI

class Router: ObservableObject {
    
    static let shared = Router()

    enum Route: Hashable {
        case logInView
        case memberCardView
        case questionView
        case calculationView
        case analysisView
        case symptomsView
        case educateView
        case solutionView
        case graphView
        case essentialsView
        case chooseGoalView
        case salesFirstView
        case salesSecondView
        case salesThirdView
    }

    @Published var path: NavigationPath = NavigationPath()

    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .logInView:
            LogInView()
        case .memberCardView:
            MemberCardView()
        case .questionView:
            QuestionTemplateView()   
        case .calculationView:
            CalculationView()  
        case .analysisView:
            AnalysisView()  
        case .symptomsView:
            SymptomsView()  
        case .educateView:
            EducateView()  
        case .solutionView:
            SolutionView()  
        case .graphView:
            GraphView() 
        case .chooseGoalView:
            ChooseGoalView()  
        case .essentialsView:
            EssentialsView() 
        case .salesFirstView:
            SalesFirst() 
        case .salesSecondView:
            SalesSecond() 
        case .salesThirdView:
            SalesThird() 
        }
    }

    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }

    func navigateBack() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}

