//
//  RouterView.swift
//  QuizApp
//
//  Created by Coderbabu on 20/06/25.
//


import SwiftUI


struct RouterView<Content: View, RouteType: Router>: View {

    @EnvironmentObject var router: Router

    private let content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationBarHidden(true) // Hides navigation bar
                .toolbar(.hidden)          // Hides back button & toolbar
                .navigationDestination(for: Router.Route.self) { route in
                    router.view(for: route)
                        .navigationBarHidden(true)
                        .toolbar(.hidden)
                }
        }
    }
}
