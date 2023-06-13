import SwiftUI

@main
struct WoofApp: App {
    @StateObject var viewModel = StartScreenViewModel()

    var body: some Scene {
        WindowGroup {
            switch viewModel.userRole {
            case .owner: OwnerMainTabView()
            case .sitter: SitterMainTabView()
            case .none: Text("Temporary sing in screen")
            }
        }
    }
}
