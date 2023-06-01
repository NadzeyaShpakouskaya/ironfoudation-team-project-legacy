import Foundation

extension Owner {
    /// Provides dummy data for `PetOwner` model.
    enum Dummy {
        /// The instance of dummy pet owner containing a static data in the fields.
        static let laraCroft = Owner(
            id: UUID(),
            name: "Lara",
            surname: "Croft",
            phone: "80299534939",
            avatarUrl: Bundle.main.url(forResource: "EmilyDoeAvatar", withExtension: "jpg"),
            address: "My town, Happiness str. 24-67",
            rating: 4.8
        )
    }
}
