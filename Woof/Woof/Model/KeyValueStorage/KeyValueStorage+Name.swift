import Foundation

extension KeyValueStorage {
    /// Provides the names for storage
    enum Name {
        /// The storage name to store information about current owner.
        static let currentOwner = "CurrentOwnerStorage"

        /// The storage name to store information about current sitter.
        static let currentSitter = "CurrentSitterStorage"

        /// The storage name to store information about user preferences.
        static let preferences = "PreferencesStorage"
    }
}
