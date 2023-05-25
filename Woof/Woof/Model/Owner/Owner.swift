import Foundation

/**
 A person who owns a pet (or several pets) and might be interested in finding a pet sitter for them.
 */
struct Owner: Identifiable, Codable {
    /// Uniquely identifies the pet owner.
    let id: UUID

    /// The first name of the pet owner.
    var name: String

    /// The last name of the pet owner.
    var surname: String

    /// The phone number of the pet owner.
    var phone: String

    /// URL that contains an avatar image of the pet owner.
    var avatarUrl: URL?

    /// The address of the pet owner.
    var address: String

    /// The rating of the pet owner.
    var rating: Double
}

extension Owner {
    init(name: String, surname: String, phone: String, address: String, rating: Double) {
        id = UUID()
        self.name = name
        self.surname = surname
        self.phone = phone
        avatarUrl = nil
        self.address = address
        self.rating = rating
    }
}