//
//  ConstantList.swift
//  QuizApp
//
//  Created by Coderbabu on 27/06/25.
//


import SwiftUI

class ConstantList {
    
    static let educateSlidesList: [Slide] = [
        Slide(title: StringConstant.slideTitle1,
              subtitle: StringConstant.slideSubtitle1,
              background: AnyView(ColorConstant.primaryEducateBg)),

        Slide(title: StringConstant.slideTitle2,
              subtitle: StringConstant.slideSubtitle2,
              background: AnyView(ColorConstant.primaryEducateBg)),

        Slide(title: StringConstant.slideTitle3,
              subtitle: StringConstant.slideSubtitle3,
              background: AnyView(ColorConstant.primaryEducateBg)),

        Slide(title: StringConstant.slideTitle4,
              subtitle: StringConstant.slideSubtitle4,
              background: AnyView(ColorConstant.primaryEducateBg)),

        Slide(title: StringConstant.slideTitle5,
              subtitle: StringConstant.slideSubtitle5,
              background: AnyView(ColorConstant.secondaryEducateBg))
    ]
    
    static let solutionSlidesList: [Slide] = [
        Slide(
            title: StringConstant.solutionSlideTitle1,
            subtitle: StringConstant.solutionSlideSubtitle1,
            background: AnyView(ColorConstant.primaryEducateBg)
        ),
        Slide(
            title: StringConstant.solutionSlideTitle2,
            subtitle: StringConstant.solutionSlideSubtitle2,
            background: AnyView(ColorConstant.primaryEducateBg)
        ),
        Slide(
            title: StringConstant.solutionSlideTitle3,
            subtitle: StringConstant.solutionSlideSubtitle3,
            background: AnyView(ColorConstant.primaryEducateBg)
        ),
        Slide(
            title: StringConstant.solutionSlideTitle4,
            subtitle: StringConstant.solutionSlideSubtitle4,
            background: AnyView(ColorConstant.primaryEducateBg)
        ),
        Slide(
            title: StringConstant.solutionSlideTitle5,
            subtitle: StringConstant.solutionSlideSubtitle5,
            background: AnyView(ColorConstant.secondaryEducateBg)
        )
    ]
    
    
    static let people: [PersonModel] = [
        .init(
            name: StringConstant.nameHuberman,
            role: StringConstant.roleHuberman,
            image: ImageConstant.physicist,
            quotes: [
                Quote(
                    title: StringConstant.quoteTitleHuberman,
                    body: StringConstant.quoteBodyHuberman
                )
            ]
        ),
        .init(
            name: StringConstant.namePhysicist,
            role: StringConstant.rolePhysicist,
            image: ImageConstant.andrewHuberman,
            quotes: [
                Quote(
                    title: StringConstant.quoteTitlePhysicist,
                    body: StringConstant.quoteBodyPhysicist
                )
            ]
        ),
        .init(
            name: StringConstant.nameJamesClear,
            role: StringConstant.roleJamesClear,
            image: ImageConstant.jamesClear,
            quotes: [
                Quote(
                    title: StringConstant.quoteTitleJamesClear,
                    body: StringConstant.quoteBodyJamesClear
                )
            ]
        ),
        .init(
            name: StringConstant.nameCameron,
            role: StringConstant.roleCameron,
            image: ImageConstant.cameron,
            quotes: [
                Quote(
                    title: StringConstant.quoteTitleCameron,
                    body: StringConstant.quoteBodyCameron
                )
            ]
        )
    ]
    
    static let reviewsList = [
        ReviewModel(
            name: StringConstant.reviewNamePJ,
            imageName: ImageConstant.review1,
            rating: 5,
            message: StringConstant.reviewMessagePJ
        ),
        
        ReviewModel(
            name: StringConstant.reviewNameBaljeet,
            imageName: ImageConstant.review2,
            rating: 5,
            message: StringConstant.reviewMessageBaljeet
        )
    ]

    
    


}
