import Foundation

/// The view model for a owner main tab view, responsible for preparing and processing data for the view.
final class OwnerMainTabViewModel: ObservableObject {
    /// Resets the current user role in the app to the default value.
    func resetCurrentRole() {
        PreferencesHandler.set(userRole: .none)
    }

    /// Indicates that confirmation on logout was obtained.
    @Published var alertIsShown = false

    /// Indicates that confirmation on logout was obtained.
    @Published var logoutIsConfirmed = false
}
