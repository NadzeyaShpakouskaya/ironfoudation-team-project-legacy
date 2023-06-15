import Foundation

/// An interface that provides interaction between the `LoginView` and the model layer.
final class LoginViewModel {
    /// Requests the model layer to save the selected user role.
    ///
    /// - Parameter userRole: The role to be saved.
    func set(_ userRole: Role) {
        PreferencesHandler.set(userRole: userRole)
    }
}
