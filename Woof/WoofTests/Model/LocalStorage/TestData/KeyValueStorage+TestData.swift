import Foundation

extension KeyValueStorage {
    /// Provides test data for key-value storage to use in unit tests.
    enum TestData {
        /// The `additional data` as raw data to use in the key-value storage.
        static let additionalData = Data("additional data".utf8)

        /// The `default data` as raw data to use in the key-value storage.
        static let defaultData = Data("default data".utf8)
    }
}
