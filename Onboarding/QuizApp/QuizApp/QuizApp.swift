//
//  QuizApp.swift
//  QuizApp
//
//  Created by Coderbabu on 23/07/25.
//

import SwiftUI

@main
struct QuizApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var router = Router()
    @StateObject private var userPreferences = UserPreferences.shared

    var body: some Scene {
        WindowGroup {
            RouterView {
                AppView()
            }
           
            .environment(\.sizeCategory, .large)
            .environmentObject(router)
            .environmentObject(userPreferences)
        }
    }
}

struct AppView: View {
    
    @EnvironmentObject var userPreferences: UserPreferences
    @State private var showNextScreen = false
    @State private var viewLoaded = false

    var body: some View {
        Group {
            if showNextScreen {
                routeNextScreen()
            } else {
                SplashView()
            }
        }
        .onAppear {
            guard !viewLoaded else { return }
            viewLoaded = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showNextScreen = true
            }
        }
    }

    private func routeNextScreen() -> some View {
        let isFirstLaunch = userPreferences.isFirstLaunch
        print("🔁 Deciding screen based on isFirstLaunch: \(isFirstLaunch)")

        let nextView: AnyView = isFirstLaunch
            ? AnyView(WelcomView())
        : AnyView(EmptyView())

        return nextView
    }
}

struct AppViewPreviews: PreviewProvider {
    static var previews: some View {
        RouterView {
            AppView()
        }
        .environmentObject(Router())
        .environmentObject(UserPreferences.shared)
    }
}
