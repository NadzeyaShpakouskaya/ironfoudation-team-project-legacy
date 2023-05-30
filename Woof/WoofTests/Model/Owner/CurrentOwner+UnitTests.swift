import Foundation

extension Owner {
    static let testStorage = "testStorage"

    static func deleteDataFor(storageName: String) {
        KeyValueStorage(storageName)
            .deleteData(for: KeyValueStorage.Key.ownerKey)
    }
}
