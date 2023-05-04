import Foundation

/**
 Describes a sitter model and contains the information about pet sitter.
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

    /// The biography or description of the sitter.
    var bio: String

    /// The rating of the sitter.
    var rating: Double

    /// The price per hour charged by the sitter.
    var pricePerHour: Double
}

// Test data for sitter model
extension Sitter {
    static let dummySitter = Sitter(
        id: UUID(),
        name: "Bob",
        surname: "Smith",
        phone: "0987654321",
        avatarUrl: URL(string: "https://example.com/image.jpg"),
        bio: "Passionate about animals",
        rating: 4.8,
        pricePerHour: 12.0
    )

    static let dummySitters: [Sitter] = [
        Sitter(
            id: UUID(),
            name: "Alice",
            surname: "Peterson",
            phone: "1234567890",
            avatarUrl: URL(string: "https://example.com/image.jpg"),
            bio: "Experienced pet sitter",
            rating: 4.5,
            pricePerHour: 10.0
        ),
        Sitter(
            id: UUID(),
            name: "Bob",
            surname: "Smith",
            phone: "0987654321",
            avatarUrl: URL(string: "https://example.com/image.jpg"),
            bio: "Passionate about animals",
            rating: 4.8,
            pricePerHour: 12.0
        ),
        Sitter(
            id: UUID(),
            name: "Charlie",
            surname: "Johnson",
            phone: "5555555555",
            avatarUrl: URL(string: "https://example.com/image.jpg"),
            bio: "Responsible and caring pet sitter",
            rating: 4.3,
            pricePerHour: 15.0
        ),
        Sitter(
            id: UUID(),
            name: "Daisy",
            surname: "Brown",
            phone: "9999999999",
            avatarUrl: URL(string: "https://example.com/image.jpg"),
            bio: "Loving and dedicated to animals",
            rating: 4.7,
            pricePerHour: 11.0
        ),
        Sitter(
            id: UUID(),
            name: "Ethan",
            surname: "Wilson",
            phone: "1111111111",
            avatarUrl: URL(string: "https://example.com/image.jpg"),
            bio: "Patient and attentive pet sitter",
            rating: 4.2,
            pricePerHour: 14.0
        ),
        Sitter(
            id: UUID(),
            name: "Fiona",
            surname: "Lee",
            phone: "2222222222",
            avatarUrl: URL(string: "https://example.com/image.jpg"),
            bio: "Experienced with various pet breeds",
            rating: 4.9,
            pricePerHour: 13.0
        ),
        Sitter(
            id: UUID(),
            name: "George",
            surname: "Taylor",
            phone: "3333333333",
            avatarUrl: URL(string: "https://example.com/image.jpg"),
            bio: "Passionate about providing quality care",
            rating: 4.6,
            pricePerHour: 12.5
        ),
    ]
}
