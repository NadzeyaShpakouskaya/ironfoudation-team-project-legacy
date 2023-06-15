import Foundation

/// The view model for a pet sitter main tab view, responsible for preparing and processing data for the view.
final class SitterMainTabViewModel: ObservableObject {
    /// Resets the current user role in the app to the default value.
    func resetCurrentRole() {
        PreferencesHandler.set(userRole: .none)
    }

    /// Indicates that an alert in the view should be shown.
    @Published var alertIsShown = false

    /// Indicates that confirmation on logout was obtained.
    @Published var logoutIsConfirmed = false
}
