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

    init(name: String, surname: String, phone: String, avatarUrl: URL?, address: String, rating: Double) {
        id = UUID()
        self.name = name
        self.surname = surname
        self.phone = phone
        self.avatarUrl = avatarUrl
        self.address = address
        self.rating = rating
    }

    convenience init() {
        self.init(name: "", surname: "", phone: "", avatarUrl: nil, address: "", rating: 0)
    }
}

extension Owner {
    /// Prepares the information to display in view.
    static func getCurrentOwner() -> Owner {
        readCurrentOwner() ?? Owner()
    }

    /// Loads the information about owner
    static func readCurrentOwner() -> Owner? {
        // read Data from storage
        guard let data = UserDefaults.standard.object(forKey: "owner") as? Data else {
            return nil
        }
        // decode as Owner
        guard let owner = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }

        return owner
    }

    static func updateCurrentOwner(with owner: Owner) {
        guard let data = try? JSONEncoder().encode(owner) else {
            // add published property to notify user about problem "couldn't save the data"???
            // appError = AppError.encodingError
            return
        }

        UserDefaults.standard.set(data, forKey: "owner")
        // save to storage
    }
}
