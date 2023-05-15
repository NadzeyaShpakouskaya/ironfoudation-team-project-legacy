import Foundation

/// The view model for a owner card view, responsible for preparing and providing data for the view.
final class OwnerCardViewModel: ObservableObject {
    @Published var owner: Owner

    /**
     Initializes an instance of the `OwnerCardViewModel` class, loads the owner object from user defaults if it exists,
     or creates a new instance of the `Owner` object with default values if not.
     */
    init() {
        let storedOwner = UserDefaults.standard.data(forKey: "storedOwner")
        let decoder = JSONDecoder()

        if let storedOwner, let decodedOwner = try? decoder.decode(Owner.self, from: storedOwner) {
            owner = decodedOwner
        } else {
            owner = Owner(name: "", surname: "", phone: "", address: "", rating: 0.0)
        }
    }

    /// Saves the owner's property to `UserDefaults` as JSON data.
    func save() {
        let encoder = JSONEncoder()
        if let encodedOwner = try? encoder.encode(owner) {
            UserDefaults.standard.set(encodedOwner, forKey: "storedOwner")
        }
    }
}
