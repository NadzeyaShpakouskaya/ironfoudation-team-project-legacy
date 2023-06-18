import Foundation

/// Responsible for managing the data and behavior of the start screen view.
final class UserRoleManager: ObservableObject {
    /// The user role that defines the app flow.
    @Published var userRole: Role

    /// Initializes a new instance of the `UserRoleManager`.
    init() {
        userRole = PreferencesHandler.getUserRole()
    }
}
