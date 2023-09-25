import Foundation

extension Sitter {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        surname = try container.decode(String.self, forKey: .surname)
        phone = (try? container.decode(String.self, forKey: .phone)) ?? ""
        avatarUrl = try? container.decode(URL.self, forKey: .avatarUrl)
        bio = try container.decode(String.self, forKey: .bio)
        rating = (try? container.decode(Double.self, forKey: .rating)) ?? 0
        pricePerHour = (try? container.decode(Double.self, forKey: .pricePerHour)) ?? 0
    }
}
