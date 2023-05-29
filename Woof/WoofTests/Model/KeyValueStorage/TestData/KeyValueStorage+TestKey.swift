extension KeyValueStorage {
    /// Keys in the key-value storage to use in unit tests.
    enum TestKey: String, CaseIterable {
        /// An example of key to use in the key-value storage.
        case keyA = "A"

        /// An example of key to use in the key-value storage.
        case keyB = "B"

        /// The key that might be used in case when there's no associated data in the key-value storage.
        case nonExistingKey = "non-existing-key"
    }
}
