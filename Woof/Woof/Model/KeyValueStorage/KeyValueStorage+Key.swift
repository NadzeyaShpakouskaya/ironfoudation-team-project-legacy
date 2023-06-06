import Foundation

extension KeyValueStorage {
    /// Provides the keys for storage.
    enum Key {
        /// The key associated with the data that contains information
        /// about the user who is currently using the app as the owner.
        static let currentOwner = "currentOwner"

        /// The key associated with the data that contains information
        /// about the user who is currently using the app as the sitter.
        static let currentSitter = "currentSitter"

        /// The key associated with the data that contains user preferences.
        static let userPreferences = "userPreferences"
    }
}
