import Foundation

/// The view model for a pet owner card, responsible for preparing and providing data for the view.
final class OwnerCardViewModel: ObservableObject {
    /// The full name of the pet owner.
    @Published var fullName: String

    /// The phone number of the pet owner
    @Published var phoneNumber: String

    /// The address of the pet owner.
    @Published var address: String

    /// The URL of the owner's avatar image.
    @Published var imageURL: URL?

    /// Initializes a new instance of the pet owner card view model with the provided owner.
    ///
    /// - Parameter sitter: The owner for which the detailed view model is created.
    init(owner: Owner) {
        self.owner = owner
        fullName = DataTransformer.fullName(name: owner.name, surname: owner.surname)
        phoneNumber = owner.phone
        address = owner.address
        imageURL = owner.avatarUrl
    }

    private var owner: Owner
}
