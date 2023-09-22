import Foundation

// swiftlint:disable force_unwrapping
enum DummyServerResponse {
    static let sitters = Set([
        Sitter(
            id: UUID(uuidString: "13a92add-96b0-48cd-a54b-eca012456c65")!,
            name: "",
            surname: "",
            phone: "",
            avatarUrl: nil,
            bio: "",
            rating: 0,
            pricePerHour: 0
        ),
        Sitter(
            id: UUID(uuidString: "ce41d154-d1e3-4d14-9e6a-e30f7220f389")!,
            name: "a",
            surname: "b",
            phone: "",
            avatarUrl: nil,
            bio: "c",
            rating: 0,
            pricePerHour: 0
        ),
        Sitter(
            id: UUID(uuidString: "731a77bd-b141-4f14-8d42-ca99e736c98d")!,
            name: "Arkasha",
            surname: "Pupkin",
            phone: "0123456789",
            avatarUrl: nil,
            bio: "Hello",
            rating: 5,
            pricePerHour: 10.5
        ),
    ])
}

// swiftlint:enable force_unwrapping
