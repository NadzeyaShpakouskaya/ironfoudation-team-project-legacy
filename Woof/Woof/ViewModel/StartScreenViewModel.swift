import Foundation

/// Responsible for managing the data and behavior of the start screen view.
final class StartScreenViewModel: ObservableObject {
    /// The user role that defines the app flow.
    @Published var userRole: Role

    /// Initializes a new instance of the `StartScreenViewModel`.
    init() {
        userRole = PreferencesHandler.getUserRole()
    }
}
