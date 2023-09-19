import Foundation

/// Represents user preferences.
struct Preferences: Codable {
    /// The selected role for the user, by default is `none`
    var selectedRole: Role = .none
    /// Indicates if sitter modified the information about themselves first time.
    var isSitterModifiedFirstTime = true
}
