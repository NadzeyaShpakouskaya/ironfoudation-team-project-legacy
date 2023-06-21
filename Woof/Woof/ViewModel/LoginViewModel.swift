import Foundation

/// An interface is responsible for preparing and providing data for the `LoginView`.
final class LoginViewModel: ObservableObject {
    // MARK: - Internal interface
    
    /// Indicates whether the owner role is selected.
    @Published var isTheOwnerRoleSelected = false
    
    /// Indicates whether the sitter role is selected.
    @Published var isTheSitterRoleSelected = false
}
