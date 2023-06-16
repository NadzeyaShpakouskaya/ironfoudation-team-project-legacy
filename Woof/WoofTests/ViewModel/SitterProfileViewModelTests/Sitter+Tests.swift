import Foundation

extension Sitter {
    /// Data used in unit tests.
    enum Test {
        /// The instance of the dummy sitter.
        static let johnSmith = Sitter(
            name: "John",
            surname: "Smith",
            phone: "1234567890",
            avatarUrl: Bundle.main.url(forResource: "JohnAlisonAvatar", withExtension: "jpg"),
            bio: "Experienced dog lover. Loves taking dogs for long walks in the park.",
            rating: 4.0,
            pricePerHour: 5.2
        )
    }
}
