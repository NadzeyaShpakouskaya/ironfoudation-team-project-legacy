import Foundation

/// Responsible for managing the data and behavior of the start screen view.
final class StartScreenViewModel: ObservableObject {
    /// The user role that defines the app flow, it's `none` by default.
    @Published var userRole: Role = .none

    init() {
        userRole = PreferencesHandler.getUserRole()
    }
}
