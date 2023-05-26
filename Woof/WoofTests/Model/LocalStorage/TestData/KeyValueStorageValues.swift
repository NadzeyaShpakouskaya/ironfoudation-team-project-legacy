/// Represents values for key-value storage for `WoofTests` target.
enum KeyValueStorageValues {
    // swiftlint:disable force_unwrapping
    /// The default value to use in the key-value storage.

    static let defaultValueToSave = "Hello, World!".data(using: .utf8)!

    /// The additional value to use in the key-value storage.
    static let additionalValueToSave = "a".data(using: .utf8)!
    // swiftlint:enable force_unwrapping
}