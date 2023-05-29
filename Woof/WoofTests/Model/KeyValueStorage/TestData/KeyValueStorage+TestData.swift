import Foundation

extension KeyValueStorage {
    /// Data for key-value storage to use in unit tests.
    enum TestData {
        /// The byte buffer of size 1 byte.
        static let dataOneByte = Data("A".utf8)

        /// The byte buffer of size 2 bytes.
        static let dataTwoBytes = Data("AA".utf8)

        /// The byte buffer of size 10 bytes.
        static let dataTenBytes = Data("AAAAAAAAAA".utf8)
    }
}
