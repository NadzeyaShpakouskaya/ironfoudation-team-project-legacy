import Foundation

struct PreferencesHandler {
    @discardableResult static func saveSelectedRole(selectedRole _: Role) -> Bool {
        let selectedRole = loadSelectedRole()

        guard let data = try? JSONEncoder().encode(selectedRole) else { return false }
        let result = KeyValueStorage(KeyValueStorage.Name.preferences)
            .save(data, for: KeyValueStorage.Key.userPreferences)
        return result
    }

    static func loadSelectedRole() -> Role? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.preferences)
            .loadData(for: KeyValueStorage.Key.userPreferences) else { return nil }

        guard let preferences = try? JSONDecoder().decode(Preferences.self, from: data) else { return nil }
        let selectedRole = preferences.selectedRole

        return selectedRole
    }
}
