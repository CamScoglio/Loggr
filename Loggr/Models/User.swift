//
//  User.swift
//  Loggr
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let email: String
    let phoneNumber: String?
    let name: String
    let profileImageUrl: String?
    let currentTime: Int
    let createdAt: Date
    let updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case email = "email"
        case phoneNumber = "phone_number"
        case name = "name"
        case profileImageUrl = "profile_image_url"
        case currentTime = "current_time"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}