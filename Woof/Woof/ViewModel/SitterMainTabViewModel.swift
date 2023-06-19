import Foundation

/// The view model for a pet sitter main tab view, responsible for preparing and processing data for the view.
final class SitterMainTabViewModel: ObservableObject {
    /// Indicates whether the alert should be shown.
    @Published var isAlertShown = false

    /// Indicates whether the logout confirmation was obtained.
    @Published var isLogoutConfirmed = false
}
