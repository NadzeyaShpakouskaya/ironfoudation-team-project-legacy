import Foundation

/// The view model for a owner card view, responsible for preparing and providing data for the view.
final class OwnerCardViewModel: ObservableObject {
    @Published var owner: Owner = .init(name: "Name", surname: "Surname", phone: "phone", address: "address", rating: 0)

    /**
     Initializes an instance of the `OwnerCardViewModel` class, loads the owner object from user defaults if it exists.
     */
    init() {
        owner = loadData()
    }

    /// Saves the owner's property to `Local Storage`.
    func save() {
        // should be implemented when LocalStorage added.
    }

    /// Loads the information about owner saved in `Local Storage`.
    /// - Returns: the `Owner` saved in
    func loadData() -> Owner {
        Owner.Dummy.emilyDoe
    }
}
