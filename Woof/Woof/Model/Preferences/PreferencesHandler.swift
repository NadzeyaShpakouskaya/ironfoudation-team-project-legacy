import Foundation

/**
 A type used for managing user preferences in the application.
 */
enum PreferencesHandler {
    // MARK: - Internal interface

    /**
     Saves the selected role as a user preference.

     - Parameters:
        - userRole: The selected role to be saved.

     - Returns: A boolean value indicating whether the saving operation was successful.
     */
    @discardableResult static func set(userRole: Role) -> Bool {
        var preferences: Preferences = loadPreferences() ?? Preferences()

        preferences.selectedRole = userRole

        return store(preferences)
    }

    /**
     Loads the selected role from user preferences.

     - Returns: The selected role for the user in the app session. If the role couldn't be loaded, returns `.none`.
     */
    @discardableResult static func getUserRole() -> Role {
        loadPreferences()?.selectedRole ?? .none
    }

    // MARK: - Private interface

    private static func loadPreferences() -> Preferences? {
        guard let data = preferencesStorage.loadData(for: preferencesKey) else {
            return nil
        }

        return try? JSONDecoder().decode(Preferences.self, from: data)
    }

    private static func store(_ preferences: Preferences) -> Bool {
        guard let data = try? JSONEncoder().encode(preferences) else {
            return false
        }

        return preferencesStorage.save(data, for: preferencesKey)
    }

    private static var preferencesStorage: KeyValueStorage {
        KeyValueStorage(KeyValueStorage.Name.preferences)
    }

    private static var preferencesKey: String {
        KeyValueStorage.Key.userPreferences
    }
}
