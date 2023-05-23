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
    func save(value: some Encodable, for key: String) {
        let data = try? JSONEncoder().encode(value)
        UserDefaults.standard.set(data, forKey: key)
    }

    /**
      Loads a value from data storage using the specified key.

      - Parameters:
         - key: The key associated with the value in data storage.
         - type: The expected data type of the value from the storage.

      - Returns: The decoded value of generic type `T` if it exists.
     */
    func loadValue<T: Decodable>(key: String, type: T.Type) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            print("No data found for key: \(key)")
            return nil
        }

        let result = try? JSONDecoder().decode(type, from: data)
        return result
    }

    /**
      Deletes the value from data storage associated with the specified key.

      - Parameters:
         - key: The key associated with the value in data storage.
     */
    func deleteValue(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }

    /// Possible keys used for storing data in persistent data storage.
    enum Key: String {
        /// Represents the key associated with the data of the owner
        case owner
    }
}
