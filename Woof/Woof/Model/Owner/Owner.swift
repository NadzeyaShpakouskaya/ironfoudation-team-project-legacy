import Foundation

/**
 A person who owns a pet (or several pets) and might be interested in finding a pet sitter for them.
 */
final class Owner: Identifiable, Codable {
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

    /**
     Creates an owner instance with the specified parameters.

     - Parameters:
        - name:  The first name of the pet owner.
        - surname: The last name of the pet owner.
        - phone: The phone number of the pet owner.
        - avatarUrl: The URL that provides an avatar image of the pet owner.
        - address: The address of the pet owner.
        - rating: The rating of the pet owner.
     */
    init(name: String, surname: String, phone: String, avatarUrl: URL?, address: String, rating: Double) {
        id = UUID()
        self.name = name
        self.surname = surname
        self.phone = phone
        self.avatarUrl = avatarUrl
        self.address = address
        self.rating = rating
    }

    /// Creates a new owner instance with the specified parameters described below:
    /// - `name` is `User`;
    /// - `avatarUrl` is nil;
    /// - `rating` is equal 0;
    /// - other parameters are specified with the empty string ("").
    convenience init() {
        self.init(name: "User", surname: "", phone: "", avatarUrl: nil, address: "", rating: 0)
    }

    static let current = CurrentOwner()
}
