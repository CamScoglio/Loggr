//
//  LoggrApp.swift
//  Loggr
//
//  Created by Cam Scoglio on 7/7/25.
//

import SwiftUI

// LoggrApp.swift
@main
struct LoggrApp: App {
    @StateObject private var authService = AuthService()
    
    var body: some Scene {
        WindowGroup {
            if authService.isAuthenticated {
                MainView()
                    .environmentObject(authService)
            } else {
                LoginView()
                    .environmentObject(authService)
            }
        }
    }
}

