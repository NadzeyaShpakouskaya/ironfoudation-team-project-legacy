import Foundation

/// An interface is responsible for changing current user role in the app for the `LoginView`.
final class LoginViewModel: ObservableObject {
    /// Saves the selected role as a user preference.
    func setUserRole(_ role: Role) -> Bool {
        PreferencesHandler.set(userRole: role)
    }
}
