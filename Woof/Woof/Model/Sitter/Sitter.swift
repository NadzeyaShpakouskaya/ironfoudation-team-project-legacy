import Foundation

/**
 A person who can walk with pet (or several pets) and provide service of walking for pet owners.
 Conforms to the `Codable` and `Identifiable` protocols.
 */
struct Sitter: Codable, Identifiable {
    /// The unique identifier for the sitter.
    let id: UUID

    /// The name of the sitter.
    var name: String

    /// The surname of the sitter.
    var surname: String

    /// The phone number of the sitter.
    var phone: String

    /// The URL of the sitter's avatar image.
    var avatarUrl: URL?

    /// The additional information about the sitter, like his experience with dogs, favorite places for walks,
    /// special skills, certificates, etc.
    var bio: String

    /// The rating of the sitter.
    var rating: Double

    /// The price per hour charged by the sitter.
    var pricePerHour: Double
}
