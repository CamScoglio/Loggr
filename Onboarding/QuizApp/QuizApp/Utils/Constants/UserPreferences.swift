//
//  UserPreferences.swift
//  QuizApp
//
//  Created by Coderbabu on 27/06/25.
//

import Foundation
import Combine

final class UserPreferences: ObservableObject {
    
    static let shared = UserPreferences()

    // MARK: - Keys
    private enum Keys {
        static let isFirstLaunch = "isFirstLaunch"
    
    }

    // MARK: - Published Properties
    @Published var isFirstLaunch: Bool {
        didSet { save(isFirstLaunch, forKey: Keys.isFirstLaunch) }
    }

    // MARK: - Init
    private init() {
        self.isFirstLaunch = UserDefaults.standard.object(forKey: Keys.isFirstLaunch) as? Bool ?? true
    }

    // MARK: - Save Helpers
    private func save<T>(_ value: T, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    private func saveCodable<T: Codable>(_ value: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    private static func loadCodable<T: Codable>(forKey key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return decoded
    }

    // MARK: - Reset Preferences
    func reset() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Keys.isFirstLaunch)

        // Revert to defaults in memory
        self.isFirstLaunch = true
    }
}
