import Foundation

extension Sitter {
    /// Provides dummy data for `Sitter` model.
    enum Dummy {
        /// The instance of dummy sitter to use in preview of views.
        static let emilyDoe = Sitter(
            id: UUID(),
            name: "Emily",
            surname: "Doe",
            phone: "1234567890",
            avatarUrl: Bundle.main.url(forResource: "EmilyDoeAvatar", withExtension: "jpg"),
            bio: """
            I am a responsible and caring pet sitter who has been working with animals for several years.
            I have a deep understanding of their needs and behaviors and is committed to providing them with the
            best care possible. Emily enjoys spending time outdoors and taking pets for walks, and she always ensures
            that they get plenty of exercise and attention. With her friendly personality and reliable work ethic,
            Emily is a great choice for pet owners who want to ensure that their furry companions are in good hands.
            """,
            rating: 4.8,
            pricePerHour: 40.25
        )
    }
}
