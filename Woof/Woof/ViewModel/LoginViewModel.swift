import Foundation

/// An interface is responsible for changing current user role in the app in the `LoginView`.
final class LoginViewModel: ObservableObject {
    /// Requests model layer to save selected user role.
    func set(_ userRole: Role) -> Bool {
        PreferencesHandler.set(userRole: userRole)
    }
}
