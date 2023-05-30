import Foundation

extension Owner {
    static let testStorage = "testStorage"

    static func deleteDataFor(storageName: String) {
        KeyValueStorage("testStorage")
            .deleteData(for: KeyValueStorage.Key.ownerKey)
    }
}
