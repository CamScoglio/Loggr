//
//  FontConstant.swift
//  QuizApp
//
//  Created by Coderbabu on 27/06/25.
//

import RswiftResources

struct FontConstant {
    
    static let leagueSpartanRegular = R.font.leagueSpartanRegular
    static let leagueSpartanSemiBold = R.font.leagueSpartanSemiBold
    static let leagueSpartanBlack = R.font.leagueSpartanBlack
    static let leagueSpartanThin = R.font.leagueSpartanThin
    static let leagueSpartanMedium = R.font.leagueSpartanMedium
    static let leagueSpartanExtraLight = R.font.leagueSpartanExtraLight
    static let leagueSpartanExtraBold = R.font.leagueSpartanExtraBold
    static let leagueSpartanBold = R.font.leagueSpartanBold
    static let leagueSpartanLight = R.font.leagueSpartanLight
    
}

public enum CustomFont {
    case leagueSpartanRegular
    case leagueSpartanSemiBold
    case leagueSpartanBlack
    case leagueSpartanThin
    case leagueSpartanMedium
    case leagueSpartanExtraLight
    case leagueSpartanExtraBold
    case leagueSpartanBold
    case leagueSpartanLight
    
    var fontName: String {
        switch self {
        case .leagueSpartanRegular: return FontConstant.leagueSpartanRegular.name 
        case .leagueSpartanSemiBold: return FontConstant.leagueSpartanSemiBold.name
        case .leagueSpartanBlack: return FontConstant.leagueSpartanBlack.name 
        case .leagueSpartanThin: return FontConstant.leagueSpartanThin.name
        case .leagueSpartanMedium: return FontConstant.leagueSpartanMedium.name 
        case .leagueSpartanExtraLight: return FontConstant.leagueSpartanExtraLight.name 
        case .leagueSpartanExtraBold: return FontConstant.leagueSpartanExtraBold.name
        case .leagueSpartanBold: return FontConstant.leagueSpartanBold.name 
        case .leagueSpartanLight: return FontConstant.leagueSpartanLight.name 
        }
    }
}
