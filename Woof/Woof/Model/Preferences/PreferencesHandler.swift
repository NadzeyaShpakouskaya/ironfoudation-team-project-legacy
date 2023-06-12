import Foundation

/**
 A type that manages saving to and retrieving user preferences from
 the local storage.
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
        var preferences = loadPreferences() ?? Preferences()

        preferences.selectedRole = userRole

        return store(preferences)
    }

    /**
     Loads the current role from user preferences.

     - Returns: The selected role for the user in the app session.
     If the role couldn't be loaded or it's not in storage, returns .none.
     */
    static func getUserRole() -> Role {
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
