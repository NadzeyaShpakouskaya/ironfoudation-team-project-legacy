import SwiftUI

@main
struct WoofApp: App {
    /// View model responsible to manage the data and behavior of the views in `Scene`.
    @StateObject private var userRoleManager = UserRoleManager()

    var body: some Scene {
        WindowGroup {
            switch userRoleManager.userRole {
            case .owner: OwnerMainTabView()
            case .sitter: SitterMainTabView()
            case .none: LoginView()
            }
        }
    }
}
