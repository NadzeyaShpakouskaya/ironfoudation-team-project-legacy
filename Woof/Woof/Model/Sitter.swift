import Foundation

struct Sitter: Codable, Identifiable {
    let id: UUID
    var name: String
    var surname: String
    var phone: String
    var avatarUrl: URL?
    var bio: String
    var rating: Double
    var pricePerHour: Double
}
