import Foundation

/// A utility model for saving to and loading data from `LocalStorage`.
class LocalStorage {
    /**
      Saves a value to the `LocalStorage` with the specified key.

      - Parameters:
         - value: The value to be encoded and saved.
         - key: The key under which the encoded value will be stored.

      - Throws: An error of type `LocalStorageError.encodeError` if the encoding fails.
     */
    func save(value: some Encodable, for key: String) throws {
        guard let data = try? JSONEncoder().encode(value) else {
            throw LocalStorageError.encodeError
        }
        UserDefaults.standard.set(data, forKey: key)
    }

    /**
      Loads a value from `LocalStorage` using the specified key.

      - Parameters:
         - key: The key associated with the value in UserDefaults.

      - Returns: The decoded value of generic type `T` if it exists.

      - Throws: An error of type `LocalStorageError.noDataForKey` if no data exists for the specified key,
      or an error of type `LocalStorageError.decodeError` if the decoding fails.
     */
    func loadValue<T: Decodable>(key: String) throws -> T {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            throw LocalStorageError.noDataForKey
        }

        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw LocalStorageError.decodeError
        }

        return result
    }

    /// Possible keys used for storing data in `LocalStorage`.
    enum Key: String {
        /// Represents the key associated with the data of the owner
        case owner
    }
}

/// Possible errors that can occur during local storage operations.
enum LocalStorageError: Error {
    /// Indicates no data is found for the specified key.
    case noDataForKey
    /// Error indicating a failure to decode the data.
    case decodeError
    /// Error indicating a failure to encode the value.
    case encodeError
}
