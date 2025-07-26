//
//  ColorConstant.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//


import SwiftUI
import RswiftResources


public extension RswiftResources.ColorResource {
    var color: Color {
        Color(self)
    }
}

struct ColorConstant {

    // MARK: - Brand Colors
    
    static let deepPurple = R.color.deepPurple.color //#8703B8
    static let violetPurple = R.color.violetPurple.color //#940BC6
    static let royalPurple = R.color.royalPurple.color //#7706A0
    static let lightGray = R.color.lightGray.color
    static let crimsonRed = R.color.crimsonRed.color //#D80004
    static let red = R.color.red.color //#FF0000
    static let emeraldGreen = R.color.emeraldGreen.color
    static let electricPurple = R.color.electricPurple.color
    static let lightPink = R.color.lightPink.color
    static let darkOrchid = R.color.darkOrchid.color
    static let white = Color.white
    static let black = Color.black
    
    // MARK: - Text Colors
    
    static let textPrimaryClr = white
    static let textSecondaryClr = black
    
    // MARK: - SignInButton

    static let signInButtonColor = LinearGradient(
        stops: [
            Gradient.Stop(color: ColorConstant.deepPurple, location: 0.25),
            Gradient.Stop(color: ColorConstant.royalPurple, location: 1.00),
        ],
        startPoint: UnitPoint(x: 0, y: 0.5),
        endPoint: UnitPoint(x: 1, y: 0.5)
    )
    
    // MARK: - NextButtonBG

    static let nextButtonBG = LinearGradient(
        stops: [
            Gradient.Stop(color: ColorConstant.deepPurple, location: 0.25),
            Gradient.Stop(color: ColorConstant.royalPurple, location: 1.00),
        ],
        startPoint: UnitPoint(x: 0, y: 0.5),
        endPoint: UnitPoint(x: 1, y: 0.5)
    )
    
    // MARK: - ChecksymptomsButton

    static let checksymptomsButton = LinearGradient(
        stops: [
            .init(color: ColorConstant.deepPurple, location: 0.25),
            .init(color: ColorConstant.red, location: 1.00)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    // MARK: - EducateBg

    static let primaryEducateBg = LinearGradient(
        stops: [Gradient.Stop(color: Color(red: 0.85, green: 0, blue: 0.01), location: 0.50)],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
    )

    
    // MARK: - AnalysisViewBg
    
    static let analysisViewBg =  LinearGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.41, green: 0, blue: 0.56), location: 0.00),
            Gradient.Stop(color: Color(red: 0.25, green: 0, blue: 0.34), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
    )
    
    static let secondaryEducateBg =   LinearGradient(
        stops: [
            .init(color: Color(red: 0.25, green: 0, blue: 0.34), location: 0),
            .init(color: Color(red: 0.54, green: 0, blue: 0.74), location: 0.6),
            .init(color: Color(red: 0.25, green: 0, blue: 0.34), location: 1),
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    //MARK: - Essentials
    
    static let commentBg = darkOrchid
    
}

