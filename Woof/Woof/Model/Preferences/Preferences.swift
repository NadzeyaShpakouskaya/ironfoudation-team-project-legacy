import Foundation

/// Represents user preferences.
struct Preferences: Codable {
    /// The selected role for the user.
    /// If role is not selected returns `nil`.
    var selectedRole: Role?
}

