import Foundation

enum PreferencesHandler {
    @discardableResult static func saveSelectedRole(_ selectedRole: Role) -> Bool {
        var preferences: Preferences = loadPreferencesFromStorage() ?? Preferences()

        preferences.selectedRole = selectedRole

        return savePreferencesToStorage(preferences)
    }

    static func loadSelectedRole() -> Role {
        guard let preferences = loadPreferencesFromStorage() else { return .none }

        let selectedRole = preferences.selectedRole

        return selectedRole
    }

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
