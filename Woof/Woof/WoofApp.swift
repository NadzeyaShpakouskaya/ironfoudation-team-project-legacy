import SwiftUI

@main
struct WoofApp: App {
    /// View model responsible to manage the data and behavior of the views in `Scene`.
    @StateObject private var viewModel = StartScreenViewModel()

    var body: some Scene {
        WindowGroup {
            switch viewModel.userRole {
            case .owner: OwnerMainTabView()
                .environmentObject(viewModel)
            case .sitter: SitterMainTabView()
                .environmentObject(viewModel)
            case .none: LoginView()
                .environmentObject(viewModel)
            }
        }
    }
}
