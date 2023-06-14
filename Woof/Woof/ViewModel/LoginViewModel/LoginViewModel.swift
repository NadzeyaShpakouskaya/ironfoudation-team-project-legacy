import Foundation

/// An interface that provides interaction between the LoginView and the model layer.
final class LoginViewModel {
    @Published var selectedRole = SelectedRole.none

    /// Requests the model layer to save the selected user role.
    ///
    /// - Parameter userRole: The role to be saved.
    /// - Returns: A boolean value indicating whether the save operation was successful.
    @discardableResult func set() -> Bool {
        switch selectedRole {
        case .owner: PreferencesHandler.set(userRole: .owner)
        case .sitter: PreferencesHandler.set(userRole: .sitter)
        case .none: return false
        }

        return true
    }
}
