import Foundation

/// The view model for a owner main tab view, responsible for preparing and processing data for the view.
final class OwnerMainTabViewModel: ObservableObject {
    /// Resets the current user role in the app to the default value.
    func resetCurrentRole() {
        PreferencesHandler.set(userRole: .none)
    }

    /// Indicates whether an alert should be shown in the view.
    @Published var alertIsShown = false

    /// Indicates whether the logout confirmation was obtained.
    @Published var logoutIsConfirmed = false
}
