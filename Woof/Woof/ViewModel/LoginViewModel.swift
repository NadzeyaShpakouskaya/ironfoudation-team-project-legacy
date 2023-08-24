import Foundation

/// An interface is responsible for preparing and providing data for the `LoginView`.
final class LoginViewModel: ObservableObject {
    // MARK: - Internal interface

    /// Indicates whether the owner role is selected.
    ///
    /// Returns `true` if the owner role is selected, otherwise `false`.
    ///
    /// The property publishes updates when the value is changed.
    @Published var isOwnerRoleSelected = false {
        didSet {
            if !isCurrentOwnerExists {
                saveNewOwner()
            }
        }
    }

    /// Indicates whether the sitter role is selected.
    ///
    /// Returns `true` if the sitter role is selected, otherwise `false`.
    ///
    /// The property publishes updates when the value is changed.
    @Published var isSitterRoleSelected = false {
        didSet {
            if !isCurrentSitterExists {
                saveNewSitter()
            }
        }
    }

    // MARK: - Private interface

    private var isCurrentOwnerExists: Bool {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner) else {
            return false
        }
        guard (try? JSONDecoder().decode(Owner.self, from: data)) != nil else {
            return false
        }

        return true
    }

    private var isCurrentSitterExists: Bool {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else {
            return false
        }
        guard (try? JSONDecoder().decode(Sitter.self, from: data)) != nil else {
            return false
        }

        return true
    }

    private func saveNewOwner() {
        let newOwner = Owner()

        guard let data = try? JSONEncoder().encode(newOwner) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .save(data, for: KeyValueStorage.Key.currentOwner)
    }

    private func saveNewSitter() {
        let newSitter = Sitter()

        guard let data = try? JSONEncoder().encode(newSitter) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .save(data, for: KeyValueStorage.Key.currentSitter)
    }
}
