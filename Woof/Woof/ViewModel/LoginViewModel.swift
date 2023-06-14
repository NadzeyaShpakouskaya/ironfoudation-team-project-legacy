import Foundation

/// An interface providing for `the LoginView` to interact with the model layer.
final class LoginViewModel: ObservableObject {
    /// Requests the model layer to save the selected user role.
    ///
    /// - Parameter userRole: The role to be saved.
    /// - Returns: A boolean value indicating whether the operation was successful.
    func set(_ userRole: Role) -> Bool {
        PreferencesHandler.set(userRole: userRole)
    }
}
