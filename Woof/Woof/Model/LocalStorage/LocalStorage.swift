import Foundation

/// A persistent storage designed for managing a collection of values.
/// These values are stored and retrieved using a key that uniquely identifies the value.
/// The key is used to find the data within the storage.
class LocalStorage {
    /// Instance of persistent storage with the specified database name.
    private let localStorage = UserDefaults(suiteName: "woofLocalStorage")
    /**
      Saves the value associated with the specified key.

      - Parameters:
         - value: The value to save in `Data` format.
         - key: The key under which the value will be stored.
     */
    func save(value: Data, for key: String) {
        localStorage?.set(value, forKey: key)
    }

    /**
      Retrieves the value associated with the given key.

      - Parameters:
         - key: The key associated with the value in data storage.

      - Returns: The value in `Data` format associated with the given key.
     If there's no value in the storage associated with the given key returns `nil`.
     */
    func loadValue(for key: String) -> Data? {
        localStorage?.data(forKey: key)
    }

    /**
      Removes the given key and its associated value from the dictionary.
     If the key isn’t found in the dictionary, method does nothing.

       - Parameters:
          - key: The key to remove along with its associated value.
      */
    func deleteValue(for key: String) {
        localStorage?.removeObject(forKey: key)
    }
}
