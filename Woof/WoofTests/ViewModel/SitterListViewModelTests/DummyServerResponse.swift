import Foundation

enum DummyServerResponse {
    // swiftlint:disable:next line_length
    static let sittersData = "{\"pet_sitters\":[{\"avatar_url\":null,\"bio\":\"\",\"id\":\"13a92add-96b0-48cd-a54b-eca012456c65\",\"name\":\"\",\"phone\":null,\"rate_per_hour\":null,\"rating\":null,\"surname\":\"\"},{\"avatar_url\":null,\"bio\":\"c\",\"id\":\"ce41d154-d1e3-4d14-9e6a-e30f7220f389\",\"name\":\"a\",\"phone\":\"1\",\"rate_per_hour\":0,\"rating\":0,\"surname\":\"b\"},{\"avatar_url\":null,\"bio\":\"Hello\",\"id\":\"731a77bd-b141-4f14-8d42-ca99e736c98d\",\"name\":\"Arkasha\",\"phone\":\"+37529123456789\",\"rate_per_hour\":10.5,\"rating\":5,\"surname\":\"Pupkin\"}]}".data(using: .utf8)

    static let sitters = Set([
        Sitter(
            // swiftlint:disable:next force_unwrapping
            id: UUID(uuidString: "13a92add-96b0-48cd-a54b-eca012456c65")!,
            name: "",
            surname: "",
            phone: nil,
            avatarUrl: nil,
            bio: "",
            rating: nil,
            pricePerHour: nil
        ),
        Sitter(
            // swiftlint:disable:next force_unwrapping
            id: UUID(uuidString: "ce41d154-d1e3-4d14-9e6a-e30f7220f389")!,
            name: "a",
            surname: "b",
            phone: "1",
            avatarUrl: nil,
            bio: "c",
            rating: 0,
            pricePerHour: 0
        ),
        Sitter(
            // swiftlint:disable:next force_unwrapping
            id: UUID(uuidString: "731a77bd-b141-4f14-8d42-ca99e736c98d")!,
            name: "Arkasha",
            surname: "Pupkin",
            phone: "+37529123456789",
            avatarUrl: nil,
            bio: "Hello",
            rating: 5,
            pricePerHour: 10.5
        ),
    ])
}
