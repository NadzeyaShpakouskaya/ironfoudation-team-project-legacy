import Foundation

/**
 A struct representing a pet owner.
 This struct conforms to the Identifiable and Codable protocols, allowing it
 to be easily used in SwiftUI and encoded/decoded from JSON.
 */
struct PetOwner: Identifiable, Codable {
    /// Uniquely identifies the pet owner.
    let id: UUID
    
    /// The first name of the pet owner.
    var name: String
    
    /// The last name of the pet owner.
    var surname: String
    
    /// The phone number of the pet owner.
    var phone: String
    
    /// The optionl URL of the pet owner's avatar image.
    var avatarUrl: URL?
    
    /// The address of the pet owner.
    var address: String
    
    /// The rating of the pet owner from 0 to 5.
    var rating: Double
}

/**
An extension to provide stub information for `PetOwner` objects.
This extension includes a static variable called `stubInformation` that provides a sample `PetOwner` object with default values for testing purposes.
*/
extension PetOwner{
    static let stubInformation = PetOwner(
        id: UUID(),
        name: "John",
        surname: "Brown",
        phone: "+13129407345",
        avatarUrl: nil,
        address: "117ap, 234 W Pols St, Chicago",
        rating: 5.0
    )
}
