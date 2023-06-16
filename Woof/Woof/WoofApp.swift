import SwiftUI

@main
struct WoofApp: App {
    // MARK: - Internal interface

    var body: some Scene {
        WindowGroup {
            switch roleFlowManager.currentRole {
            case .owner: OwnerMainTabView()
                .environmentObject(roleFlowManager)
            case .sitter: SitterMainTabView()
                .environmentObject(roleFlowManager)
            case .none: LoginView()
                .environmentObject(roleFlowManager)
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var roleFlowManager = RoleFlowManager()
}
