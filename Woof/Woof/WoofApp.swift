import SwiftUI

@main
struct WoofApp: App {
    // MARK: - Internal interface

    var body: some Scene {
        WindowGroup {
            switch userRoleManager.userRole {
            case .owner: OwnerMainTabView()
                .environmentObject(userRoleManager)
            case .sitter: SitterMainTabView()
                .environmentObject(userRoleManager)
            case .none: LoginView()
                .environmentObject(userRoleManager)
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var userRoleManager = UserRoleManager()
}
