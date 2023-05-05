import Foundation

/**
A struct representing a pet owner.
This struct conforms to the Identifiable and Codable protocols, allowing it to be easily used in SwiftUI and encoded/decoded from JSON.
*/
struct PetOwner: Identifiable, Codable {
    ///Uniquely identifies the pet owner.
    var id: UUID
    
    ///The first name of the pet owner.
    var name: String
    
    ///The last name of the pet owner.
    var surname: String
    
    ///The phone number of the pet owner.
    var phone: String
    
    ///The optionl URL of the pet owner's avatar image.
    var avatarUrl: URL?
    
    ///The address of the pet owner.
    var address: String
    
    ///The rating of the pet owner from 0 to 5.
    var Rating: Double
}
