import Foundation

/// The view model for a owner card view, responsible for preparing and providing data for the view.
final class OwnerCardViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var phone: String = ""
    @Published var address: String = ""
    @Published var avatarURL: URL?
    /**
     Initializes an instance of the `OwnerCardViewModel` class, loads the owner object from user defaults if it exists.
     */
    init() {
        currentOwner = Owner.getCurrentOwner()
        name = currentOwner.name
        surname = currentOwner.surname
        phone = currentOwner.phone
        address = currentOwner.address
        avatarURL = currentOwner.avatarUrl
    }

    private var currentOwner: Owner

    /// Saves the owner's property to `Local Storage`.
    func save() {
        currentOwner.name = name
        currentOwner.surname = surname
        currentOwner.phone = phone
        currentOwner.address = address
        currentOwner.avatarUrl = avatarURL

        Owner.updateCurrentOwner(with: currentOwner)
    }
}
