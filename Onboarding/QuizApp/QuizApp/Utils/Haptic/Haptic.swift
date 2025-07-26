
import Foundation
import UIKit
import SwiftUI

// MARK: - Haptic Types

/// Enum defining various types of haptic feedback supported
enum HapticType {
    case error
    case success
    case warning
    case light
    case medium
    case heavy
    case soft
    case rigid
    case selection
}

// MARK: - Haptic Manager

/// Centralized manager for triggering different types of haptic feedback
class Haptic {
    
    // MARK: - Singleton

    /// Shared instance of Haptic to use globally
    static let shared = Haptic()

    /// Private initializer to prevent instantiation from outside
    private init() {}

    // MARK: - Haptic Generator

    /// Generates haptic feedback of the specified type
    /// - Parameter type: The kind of haptic feedback to produce
    func generate(_ type: HapticType) {
        switch type {
        
        case .error:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)
            
        case .success:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.success)
            
        case .warning:
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.warning)
            
        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.prepare()
            generator.impactOccurred()
            
        case .medium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.prepare()
            generator.impactOccurred()
            
        case .heavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()
            
        case .soft:
            if #available(iOS 13.0, *) {
                let generator = UIImpactFeedbackGenerator(style: .soft)
                generator.prepare()
                generator.impactOccurred()
            }

        case .rigid:
            if #available(iOS 13.0, *) {
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.prepare()
                generator.impactOccurred()
            }

        case .selection:
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
    }
}

// MARK: - Example Usage in SwiftUI

/*
struct HapticDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Success Haptic") {
                Haptic.shared.generate(.success)
            }

            Button("Light Impact") {
                Haptic.shared.generate(.light)
            }

            Button("Warning Notification") {
                Haptic.shared.generate(.warning)
            }

            Button("Selection Feedback") {
                Haptic.shared.generate(.selection)
            }

            Button("Heavy Impact") {
                Haptic.shared.generate(.heavy)
            }
        }
        .padding()
        .font(.headline)
    }
}
*/
