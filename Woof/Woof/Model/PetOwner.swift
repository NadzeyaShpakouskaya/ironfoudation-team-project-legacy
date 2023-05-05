import Foundation

struct PetOwner: Identifiable, Codable {
    var id: UUID
    var name: String
    var surname: String
    var phone: String
    var avatarUrl: URL?
    var address: String
    var Rating: Double
}
