import Foundation

/// A role of a user in the app's session. A user can have one active role.
enum Role: Codable {
    /// An owner of the pet(s).
    case owner

    /// A sitter for the pet(s).
    case sitter
    
    /// Not specified role, when the user has not chosen any role yet.
    case none
}
