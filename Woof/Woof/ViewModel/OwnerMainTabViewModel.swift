import Foundation

/// The view model for a owner main tab view, responsible for preparing and processing data for the view.
final class OwnerMainTabViewModel: ObservableObject {
    /// Resets the current owner role  in the app by default value `none`.
    func resertCurrentOwnerRole() {
        PreferencesHandler.set(userRole: .none)
    }
}
