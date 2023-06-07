import Foundation

/**
  A helper struct for handling preferences in tests.
 - Note: This struct is intended for use in test cases only.
 */
struct PreferencesHandlerTestHelper {
    /**
     Cleans the storage used for preferences.
     This method deletes the user preferences data from the key-value storage.

     Example usage:
     ```
     PreferencesHandlerTestHelper.cleanStorage()
     ```
     */
    static func cleanStorage() {
        let keyValueStorage = KeyValueStorage(KeyValueStorage.Name.preferences)
        keyValueStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }
}
