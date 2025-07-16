//
//  MainView.swift
//  Loggr
//
//  Created by Cam Scoglio on 7/14/25.
//

import Foundation
import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
        
        var body: some View {
            VStack (spacing: 0) {
                LogView()
                content
            }
        }
        
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    CustomNavBarContainerView 
    
    
}
