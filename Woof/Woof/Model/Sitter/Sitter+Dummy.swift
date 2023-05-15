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

        /// The instance of dummy sitter list to use in preview of views.
        static let sitters = [
            // swiftlint:disable line_length
            Sitter(id: UUID(), name: "Jane", surname: "Smith", phone: "0987654321", avatarUrl: Bundle.main.url(forResource: "EmilyDoeAvatar", withExtension: "jpg"), bio: "Certified dog trainer. Enjoys playing fetch and teaching new tricks.", rating: 4.8, pricePerHour: 20.0),
            Sitter(id: UUID(), name: "John", surname: "Alison", phone: "1234567890", avatarUrl: URL(string: "https://example.com/avatar1.jpg"), bio: "Experienced dog lover. Loves taking dogs for long walks in the park.", rating: 4.5, pricePerHour: 15.0),
            Sitter(id: UUID(), name: "Emily", surname: "Johnson", phone: "9876543210", avatarUrl: URL(string: "https://example.com/avatar3.jpg"), bio: "Passionate about caring for dogs. Enjoys spending time outdoors with furry friends.", rating: 4.9, pricePerHour: 25.0),
            Sitter(id: UUID(), name: "Michael", surname: "Brown", phone: "0123456789", avatarUrl: URL(string: "https://example.com/avatar4.jpg"), bio: "Experienced pet sitter. Provides a safe and comfortable environment for dogs.", rating: 4.7, pricePerHour: 18.0),
            Sitter(id: UUID(), name: "Olivia", surname: "Davis", phone: "8765432109", avatarUrl: URL(string: "https://example.com/avatar5.jpg"), bio: "Loves dogs of all sizes and breeds. Enjoys exploring new walking trails.", rating: 4.6, pricePerHour: 17.0),
            Sitter(id: UUID(), name: "William", surname: "Wilson", phone: "5432109876", avatarUrl: URL(string: "https://example.com/avatar6.jpg"), bio: "Dog enthusiast with a background in pet care. Provides personalized attention to every furry client.", rating: 4.7, pricePerHour: 19.0),
            Sitter(id: UUID(), name: "Sophia", surname: "Taylor", phone: "9012345678", avatarUrl: URL(string: "https://example.com/avatar7.jpg"), bio: "Experienced in handling energetic dogs. Creates fun and engaging activities for furry pals.", rating: 4.8, pricePerHour: 22.0),
            Sitter(id: UUID(), name: "James", surname: "Anderson", phone: "6789012345", avatarUrl: URL(string: "https://example.com/avatar8.jpg"), bio: "Professional dog walker with a passion for canine fitness. Customizes exercise routines based on individual needs.", rating: 4.7, pricePerHour: 21.0),
            Sitter(id: UUID(), name: "Ava", surname: "Moore", phone: "4567890123", avatarUrl: URL(string: "https://example.com/avatar9.jpg"), bio: "Compassionate dog lover. Provides a loving and caring environment for furry companions.", rating: 4.5, pricePerHour: 16.0),
            // swiftlint:enable line_length
        ]
    }
}
