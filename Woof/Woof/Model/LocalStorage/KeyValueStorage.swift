import Foundation

/// A persistent storage designed for managing a collection of values.
/// These values are stored and retrieved using a key that uniquely identifies the value.
/// The key is used to find the data within the storage.
class KeyValueStorage {
    /// Instance of persistent storage with the specified database name.
    private let localStorage = UserDefaults(suiteName: "com.foundation-iron.iOS.Woof")
    /**
      Saves the value associated with the specified key.

      - Parameters:
         - data: The value to save as a byte buffer in memory.
         - key: The key under which the value will be stored.
     */
    @discardableResult func save(data: Data, for key: String) -> Bool {
        localStorage?.set(data, forKey: key)
        guard let _ = localStorage?.object(forKey: key) as? Data else { return false }
        return true
    }

    /**
      Retrieves the value associated with the given key.

      - Parameters:
         - key: The key associated with the value in data storage.

      - Returns: The value in `Data` type associated with the given key.
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
