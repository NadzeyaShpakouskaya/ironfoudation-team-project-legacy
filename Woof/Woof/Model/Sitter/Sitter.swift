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
    var phone: String?

    /// The URL of the sitter's avatar image.
    var avatarUrl: URL?

    /// The additional information about the sitter, like his experience with dogs, favorite places for walks,
    /// special skills, certificates, etc.
    var bio: String

    /// The rating of the sitter.
    var rating: Double?

    /// The price per hour charged by the sitter.
    var pricePerHour: Double?

    /**
     Creates a pet sitter instance with the specified parameters with the unique identifier.
     Each instance of the new pet sitter has a unique id.

     - Parameters:
      - name: The first name of the pet sitter.
      - surname: The last name of the pet sitter.
      - phone: The phone number of the pet sitter.
      - avatarURL: The URL that provides an avatar image of the pet sitter.
      - bio: The additional information about the pet sitter.
      - rating: The rating of the pet sitter.
      - pricePerHour: The price per hour charged by the pet sitter.
     */
    init(
        name: String,
        surname: String,
        phone: String?,
        avatarUrl: URL?,
        bio: String,
        rating: Double?,
        pricePerHour: Double?
    ) {
        id = UUID()
        self.name = name
        self.surname = surname
        self.phone = phone
        self.avatarUrl = avatarUrl
        self.bio = bio
        self.rating = rating
        self.pricePerHour = pricePerHour
    }

    /**
     Creates a new pet sitter instance with the specified parameters described below.
     Each instance of the new pet sitter has a unique id.

     The parameters of a new initialized instance are:
     - `name` is hardcoded value `User`;
     - `avatarUrl` is nil;
     - `rating` is equal 0;
     - `pricePerHour`is equal 0;
     - other parameters are specified with the empty string ("").
     */
    init() {
        self.init(
            name: "User",
            surname: "",
            phone: "",
            avatarUrl: nil,
            bio: "",
            rating: 0,
            pricePerHour: 0
        )
    }
}
