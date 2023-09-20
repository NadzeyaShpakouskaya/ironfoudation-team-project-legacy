extension Sitter {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case surname
        case phone
        case avatarUrl
        case bio
        case rating
        case pricePerHour = "ratePerHour"
    }
}
