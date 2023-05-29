import Foundation

/// A persistent storage designed for storing, retrieving, and managing a collection of data objects.
/// These data objects are stored and retrieved using a key.
/// The key uniquely identifies the data in the storage, and is used to find the data within the storage.
final class KeyValueStorage {
    private var storage: UserDefaults?

    /**
     Creates a key-value storage with the specified name.
     The storage is valid and active for the current iOS app.

     - Parameter storageName: The name of the storage to identify the data. The name must be unique within the app.
     */
    init(_ storageName: String) {
        let bundleIdPrefix = Bundle.main.bundleIdentifier ?? "ios-app"
        let storagePrefix = "key-value-storage-over-the-ios-user-defaults-storage"

        storage = UserDefaults(suiteName: "\(bundleIdPrefix)-\(storagePrefix)-\(storageName)")
    }

    /**
     Stores the data associated with the specified key.

     - Parameters:
        - data: The raw data (as a byte buffer) to persist.
        - key: The key with which to associate the data.

     - Returns: `true` if the data was successfully saved, otherwise returns `false`.
     */
    @discardableResult func save(_ data: Data, for key: String) -> Bool {
        guard let storage else { return false }
        storage.set(data, forKey: key)
        return true
    }

    /**
      Retrieves the data associated with the specified key.

      - Parameters:
         - key: A key in the current storage.

      - Returns: The raw data (as a byte buffer)  associated with the given key, otherwise returns `nil`.
     */
    func loadData(for key: String) -> Data? {
        storage?.data(forKey: key)
    }

    /**
     Removes the specified key and the associated data.
     If the key isn’t found, method does nothing.

     - Parameter key: The key to remove along with its associated data.
     */
    func deleteData(for key: String) {
        storage?.removeObject(forKey: key)
    }
}
