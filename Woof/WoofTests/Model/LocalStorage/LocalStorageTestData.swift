import Foundation

enum LocalStorageTestData {
    enum Keys: CaseIterable {
        static let key = "A"
        static let nonExistingKey = "nonExistingKey"
    }

    enum Values {
        static let defaultValueToSave = "Hello, World!".data(using: .utf8)!
        static let additionalValueToSave = "a".data(using: .utf8)!
    }
}
