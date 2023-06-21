import Foundation

/// An interface is responsible for preparing and providing data for the `LoginView`.
final class LoginViewModel: ObservableObject {
    // MARK: - Internal interface

    /// Indicates whether the owner role is selected.
    @Published var isTheOwnerRoleSelected = false

    /// Indicates whether the sitter role is selected.
    @Published var isTheSitterRoleSelected = false
    
    // MARK: - Private interface

    private func loadOwnerFromStorage() -> Owner? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner) else {
            return nil
        }
        guard let owner = try? JSONDecoder().decode(Owner.self, from: data) else {
            return nil
        }

        return owner
    }

    private func loadSitterFromStorage() -> Sitter? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else {
            return nil
        }
        guard let sitter = try? JSONDecoder().decode(Sitter.self, from: data) else {
            return nil
        }

        return sitter
    }

}
