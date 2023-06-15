import Foundation

/// The object that changes the state of the data in the model based on user actions in `LoginView`.
final class LoginViewModel {
    /// Sets the current's user role in the app.
    ///
    /// - Parameter userRole: The role to set.
    func set(_ userRole: Role) {
        PreferencesHandler.set(userRole: userRole)
    }
}
