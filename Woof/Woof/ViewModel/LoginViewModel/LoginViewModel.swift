import Foundation

/// An interface that provides interaction between the LoginView and the model layer.
final class LoginViewModel: ObservableObject {
    /// The selected user role in the app's session.
    @Published var selectedRole = SelectedRole.none

    /// Requests the model layer to save the selected user role.
    ///
    /// - Returns: A boolean value indicating the success of setting the user role.
    @discardableResult func setUserRole() -> Bool {
        switch selectedRole {
        case .owner: PreferencesHandler.set(userRole: .owner)
        case .sitter: PreferencesHandler.set(userRole: .sitter)
        case .none: return false
        }

        return true
    }
}
