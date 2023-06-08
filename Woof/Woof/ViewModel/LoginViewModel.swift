import Foundation

final class LoginViewModel: ObservableObject {
    @discardableResult func setUserRole(_ role: Role) -> Bool {
        PreferencesHandler.set(userRole: role)
    }
}
