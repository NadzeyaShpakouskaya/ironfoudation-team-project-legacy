import Foundation

/// An interface responsible for changing the current user role in the app on the `LoginView`.
final class LoginViewModel: ObservableObject {
    /// Requests model layer to save selected user role.
    ///
    /// - Parameter userRole: The role to be saved.
    /// - Returns: A boolean indicating whether the operation was successful.
    func set(_ userRole: Role) -> Bool {
        PreferencesHandler.set(userRole: userRole)
    }
}
