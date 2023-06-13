import Foundation

/// An interface is responsible for preparing and providing data for the `LoginView`.
final class LoginViewModel: ObservableObject {
    
    func setUserRole(_ role: Role) -> Bool {
        PreferencesHandler.set(userRole: role)
    }
}
