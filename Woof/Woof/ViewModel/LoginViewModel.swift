import Foundation

/// An interface is responsible for preparing and providing data for the `LoginView`.
final class LoginViewModel: ObservableObject {
    // MARK: - Internal interface

    /// Indicates whether the owner role is selected.
    ///
    /// Returns `true` if the owner role is selected, otherwise `false`.
    ///
    /// The property publishes updates when the value is changed.
    @Published var isTheOwnerRoleSelected = false {
        didSet {
            createNewOwner()
        }
    }

    /// Indicates whether the sitter role is selected.
    ///
    /// Returns `true` if the sitter role is selected, otherwise `false`.
    ///
    /// The property publishes updates when the value is changed.
    @Published var isTheSitterRoleSelected = false {
        didSet {
            createNewSitter()
        }
    }

    // MARK: - Private interface

    private func createNewOwner() {
        guard !isTheCurrentOwnerExists else { return }

        let newOwner = Owner()

        guard let data = try? JSONEncoder().encode(newOwner) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .save(data, for: KeyValueStorage.Key.currentOwner)
    }

    private func createNewSitter() {
        guard !isTheCurrentOwnerExists else { return }

        let newSitter = Sitter()

        guard let data = try? JSONEncoder().encode(newSitter) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .save(data, for: KeyValueStorage.Key.currentSitter)
    }

    private var isTheCurrentOwnerExists: Bool {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner) else {
            return false
        }
        guard let owner = try? JSONDecoder().decode(Owner.self, from: data) else {
            return false
        }

        return true
    }

    private var isTheCurrentSitterExists: Bool {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else {
            return false
        }
        guard let sitter = try? JSONDecoder().decode(Sitter.self, from: data) else {
            return false
        }

        return true
    }
}
