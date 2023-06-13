import Foundation

/// The view model for a pet sitter main tab view, responsible for preparing and processing data for the view.
final class SitterMainTabViewModel: ObservableObject {
    /// Resets the current sitter role  in the app by default value `none`.
    func resertCurrentSitterRole() {
        PreferencesHandler.set(userRole: .none)
    }
}
