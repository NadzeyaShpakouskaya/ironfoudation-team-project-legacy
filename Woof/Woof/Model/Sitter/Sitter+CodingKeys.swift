import Foundation

extension Sitter {
    // Defines custom CodingKeys enum to map properties to JSON keys
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case surname
        case phone
        case avatarUrl
        case bio
        case rating
        case pricePerHour = "rate_per_hour"
    }
}
