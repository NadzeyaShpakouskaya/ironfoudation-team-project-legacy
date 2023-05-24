import Foundation

/// A persistent data storage mechanism, allowing you to store key-value pairs
/// that remain accessible across multiple app launches.
class LocalStorage {
    /**
      Saves a value to the data storage with the specified key.

      - Parameters:
         - value: The value to be encoded and saved.
         - key: The key under which the encoded value will be stored.
     */
    func save(value: Data, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    /**
      Loads a value from data storage using the specified key.

      - Parameters:
         - key: The key associated with the value in data storage.
         - type: The expected data type of the value from the storage.

      - Returns: The decoded value of generic type `T` if it exists.
     // TODO: returns nil, then///
     */
    func loadValue(for key: String) -> Data? {
        UserDefaults.standard.data(forKey: key)
    }

    /**
      Deletes the value from data storage associated with the specified key.

      - Parameters:
         - key: The key associated with the value in data storage.
     */
    func deleteValue(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
