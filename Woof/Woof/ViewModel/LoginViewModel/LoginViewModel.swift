import Foundation

/// An interface that provides interaction between the LoginView and the model layer.
final class LoginViewModel: ObservableObject {
    /// Requests the model layer to save the selected user role.
    ///
    /// - Returns: A boolean value indicating the success of setting the user role.
    @discardableResult func setUserRole(_ selectedRole: SelectedRole) -> Bool {
        switch selectedRole {
        case .owner: PreferencesHandler.set(userRole: .owner)
        case .sitter: PreferencesHandler.set(userRole: .sitter)
        case .none: return false
        }

        return true
    }
}
