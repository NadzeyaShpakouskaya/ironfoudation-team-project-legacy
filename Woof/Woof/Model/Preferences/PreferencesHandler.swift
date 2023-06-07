import Foundation

/**
 A type used for managing user preferences in an application.
 */
enum PreferencesHandler {
    /**
     Saves the selected role as a user preference.

     - Parameters:
        - selectedRole: The selected role to be saved.

     - Returns: A boolean value indicating whether the saving operation was successful.
     */
    @discardableResult static func saveSelectedRole(_ selectedRole: Role) -> Bool {
        var preferences: Preferences = loadPreferencesFromStorage() ?? Preferences()

        preferences.selectedRole = selectedRole

        return savePreferencesToStorage(preferences)
    }

    /**
     Loads the selected role from user preferences.

     - Returns: The selected role, or `.none` if no preferences are found.
     */
    static func loadSelectedRole() -> Role {
        guard let preferences = loadPreferencesFromStorage() else { return .none }

        let selectedRole = preferences.selectedRole

        return selectedRole
    }
    
    // MARK: - Private interface
    
    private static func loadPreferencesFromStorage() -> Preferences? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.preferences)
            .loadData(for: KeyValueStorage.Key.userPreferences) else { return nil }

        guard let preferences = try? JSONDecoder().decode(Preferences.self, from: data) else { return nil }
        return preferences
    }

    private static func savePreferencesToStorage(_ preferences: Preferences) -> Bool {
        guard let data = try? JSONEncoder().encode(preferences) else { return false }
        let result = KeyValueStorage(KeyValueStorage.Name.preferences)
            .save(data, for: KeyValueStorage.Key.userPreferences)
        return result
    }
}
