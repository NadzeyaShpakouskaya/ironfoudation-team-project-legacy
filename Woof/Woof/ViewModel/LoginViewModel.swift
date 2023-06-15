import Foundation

/// An interface providing for `the LoginView` to interact with the model layer.
final class LoginViewModel: ObservableObject {
    /// Requests the model layer to save the selected user role.
    ///
    /// - Parameter userRole: The role to be saved.
    func set(_ userRole: Role) {
        PreferencesHandler.set(userRole: userRole)
    }
}
