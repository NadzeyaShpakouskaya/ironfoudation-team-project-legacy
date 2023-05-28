extension KeyValueStorage {
    /// Provides keys for key-value storage to use in unit tests.
    enum TestKey {
        /// The default key to use in the key-value storage.
        static let defaultKey = "defaultKey"

        /// The key for which it is safe to expect there's no corresponding value in the test storage.
        static let nonExistingKey = "nonExistingKey"
    }
}
