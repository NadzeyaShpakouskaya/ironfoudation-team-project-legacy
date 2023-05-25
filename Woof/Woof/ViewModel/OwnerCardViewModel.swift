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
        prepareOwnerData()
    }

    /// Saves the owner's property to `Local Storage`.
    func save() {
        // should be implemented when LocalStorage added.
    }

    /// Loads the information about owner saved in `Local Storage`.
    private func prepareOwnerData() {
        let owner = Owner.Dummy.emilyDoe
        name = owner.name
        surname = owner.surname
        phone = owner.phone
        address = owner.address
        avatarURL = owner.avatarUrl
    }
}
