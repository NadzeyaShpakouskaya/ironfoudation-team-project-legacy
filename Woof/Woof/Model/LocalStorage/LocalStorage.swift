import Foundation

/// A utility model for saving and loading data from user defaults.
class LocalStorage {
    /**
      Saves an encodable value to the UserDefaults with the specified key.

      - Parameters:
         - value: The value to be encoded and saved.
         - key: The key under which the encoded value will be stored.

      - Throws: An error of type `LocalStorageError.encodeError` if the encoding fails.

      This function encodes the `value` using `JSONEncoder` and stores the encoded data in the
     UserDefaults with the specified `key`. If the encoding fails, an error is thrown.
     */
    func save(value: some Encodable, for key: String) throws {
        guard let data = try? JSONEncoder().encode(value) else {
            throw LocalStorageError.encodeError
        }
        UserDefaults.standard.set(data, forKey: key)
    }

    /**
      Loads a decodable value from UserDefaults using the specified key.

      - Parameters:
         - key: The key associated with the value in UserDefaults.

      - Returns: The decoded value of generic type `T` if it exists.

      - Throws: An error of type `LocalStorageError.noDataForKey` if no data exists for the specified key,
      or an error of type `LocalStorageError.decodeError` if the decoding fails.

      This function retrieves the data associated with the specified `key` from UserDefaults.
      If the data exists, it attempts to decode it as type `T` using `JSONDecoder`.
      If the decoding is successful, the decoded value is returned.
      If no data exists for the specified key, an error is thrown indicating the absence of data.
      If the decoding fails, an error is thrown.
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

    /// Possible keys used for storing data in user defaults.
    enum Key: String {
        /// Key representing the data of the owner.
        case owner
    }
}

/// Possible errors that can occur during local storage operations.
enum LocalStorageError: Error {
    /// Error indicating no data is found for the specified key.
    case noDataForKey
    /// Error indicating a failure to decode the data.
    case decodeError
    /// Error indicating a failure to encode the value.
    case encodeError
}
