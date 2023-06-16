import Foundation

/// Responsible for managing and actual state of the current user role in the application.
final class RoleFlowManager: ObservableObject {
    /// The user role that defines the app flow.
    @Published var userRole: Role

    /// Initializes a new instance of the `RoleFlowManager`.
    init() {
        userRole = PreferencesHandler.getUserRole()
    }

    /// Resets the current user role in the app to the default value.
    func resetCurrentRole() {
        PreferencesHandler.set(userRole: .none)
        userRole = .none
    }

    /// Sets the current's user role in the app.
    ///
    /// - Parameter userRole: The role to set.
    func set(_ userRole: Role) {
        PreferencesHandler.set(userRole: userRole)
        self.userRole = userRole
    }
}
