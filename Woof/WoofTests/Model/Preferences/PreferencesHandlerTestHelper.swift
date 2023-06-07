import Foundation

struct PreferencesHandlerTestHelper {
    static func cleanStorage() {
        let keyValueStorage = KeyValueStorage(KeyValueStorage.Name.preferences)
        keyValueStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }
}
