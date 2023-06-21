import SwiftUI
// Test line
@main
struct WoofApp: App {
    // MARK: - Internal interface

    var body: some Scene {
        WindowGroup {
            switch userRoleViewModel.userRole {
            case .owner: OwnerMainTabView()
                .environmentObject(userRoleViewModel)
            case .sitter: SitterMainTabView()
                .environmentObject(userRoleViewModel)
            case .none: LoginView()
                .environmentObject(userRoleViewModel)
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var userRoleViewModel = UserRoleViewModel()
}
