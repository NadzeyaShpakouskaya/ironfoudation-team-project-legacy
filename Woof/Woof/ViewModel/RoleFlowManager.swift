import Foundation

/// Responsible for managing and actual state of the current user role in the application.
final class RoleFlowManager: ObservableObject {
    /// The current user role that defines the app flow.
    @Published var userRole: Role

    /// Initializes a new instance of the `RoleFlowManager`.
    init() {
        userRole = PreferencesHandler.getUserRole()
    }

    /// Resets the current user role in the app to the default value.
    func resetCurrentRole() {
        userRole = .none
        PreferencesHandler.set(userRole: userRole)
    }

    /// Sets the owner role in the application.
    func setOwnerRole() {
        userRole = .owner
        PreferencesHandler.set(userRole: userRole)
    }

    /// Sets the sitter role in the application.
    func setSitterRole() {
        userRole = .sitter
        PreferencesHandler.set(userRole: userRole)
    }
}
