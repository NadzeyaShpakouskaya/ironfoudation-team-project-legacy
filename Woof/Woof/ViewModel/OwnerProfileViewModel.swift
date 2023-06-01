import Foundation

/// The view model for a owner profile view that is responsible for preparing and providing data for it.
final class OwnerProfileViewModel: ObservableObject {
    /// The name of owner
    @Published var name: String = ""

    /// The surname of owner
    @Published var surname: String = ""

    /// The phone number of owner
    @Published var phone: String = ""

    /// The home address of owner
    @Published var address: String = ""

    /// The URL of the owner's avatar image.
    @Published var avatarURL: URL?

    /**
     Initializes an instance of the `OwnerProfileViewModel` class.
     */
    init() {
        currentOwner = getOwner()

        name = currentOwner.name
        surname = currentOwner.surname
        phone = currentOwner.phone
        address = currentOwner.address
        avatarURL = currentOwner.avatarUrl
    }

    /// Request model layer to save modified data.
    func save() {
        currentOwner.name = name
        currentOwner.surname = surname
        currentOwner.phone = phone
        currentOwner.address = address
        currentOwner.avatarUrl = avatarURL

        guard let data = try? JSONEncoder().encode(currentOwner) else { return }

        KeyValueStorage(KeyValueStorage.StorageName.ownerStorage)
            .save(data, for: KeyValueStorage.Key.ownerKey)
    }

    /**
     Returns the owner information that will be displayed in view.

        - Returns: The owner instance from model layer or new instance of `Owner`,
     if loading from model layer is failed.
     */
    func getOwner() -> Owner {
        loadOwnerFromStorage() ?? Owner()
    }

    // MARK: - Private interface

    private lazy var currentOwner: Owner = getOwner()

    private func loadOwnerFromStorage() -> Owner? {
        guard let data = KeyValueStorage(KeyValueStorage.StorageName.ownerStorage)
            .loadData(for: KeyValueStorage.Key.ownerKey) else {
            return nil
        }
        guard let owner = try? JSONDecoder().decode(Owner.self, from: data) else {
            return nil
        }

        return owner
    }
}
