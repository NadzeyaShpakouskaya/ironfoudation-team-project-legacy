import Foundation

/// A persistent storage designed for managing a collection of values.
/// These values are stored and retrieved using a key that uniquely identifies the value.
/// The key is used to find the data within the storage.
class LocalStorage {
    private let localStorage = UserDefaults(suiteName: "woofLocalStorage")

    /**
      Saves the value associated with the specified key.

      - Parameters:
         - value: The value to be encoded and saved.
         - key: The key under which the encoded value will be stored.
     */
    func save(value: Data, for key: String) {
        localStorage?.set(value, forKey: key)
    }

    /**
      Retrieves the value associated with the given key.

      - Parameters:
         - key: The key associated with the value in data storage.

      - Returns: The value associated with the given key.
     If there's no value in the storage associated with the given key returns `nil`.
     */
    func loadValue(for key: String) -> Data? {
        localStorage?.data(forKey: key)
    }

    /**
      Deletes the value from data storage associated with the specified key.
      If non-existing key, the data storage will remain unchanged, and there will be no error or exception thrown.

      - Parameters:
         - key: The key associated with the value in data storage.
     */
    func deleteValue(forKey key: String) {
        localStorage?.removeObject(forKey: key)
    }
}
