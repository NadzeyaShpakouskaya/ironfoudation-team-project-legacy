import Foundation

/// The view model for a pet sitter profile view that is responsible for preparing and providing data for it.
final class SitterProfileViewModel: ObservableObject {
    // MARK: - Internal interface

    /// The name of the pet sitter.
    @Published var name: String = ""

    /// The surname of the pet sitter.
    @Published var surname: String = ""

    /// The phone of the pet sitter.
    @Published var phone: String = ""

    /// The URL of the pet sitter's avatar image.
    @Published var avatarUrl: URL?

    /// The additional information about the pet sitter, like his experience with dogs, favourite places for walks,
    /// special skills, certificates, etc.
    @Published var bio: String = ""

    /// The price per hour for walking charged by the pet sitter.
    @Published var pricePerHour: Double = 0

    /**
     Initialises an instance of the `SitterProfileViewModel` class.
     */
    init() {
        currentSitter = getCurrentSitter()

        name = currentSitter.name
        surname = currentSitter.surname
        phone = currentSitter.phone
        avatarUrl = currentSitter.avatarUrl
        bio = currentSitter.bio
        pricePerHour = currentSitter.pricePerHour
    }

    /// Requests model layer to save modified data.
    func save() {
        currentSitter.name = name
        currentSitter.surname = surname
        currentSitter.phone = phone
        currentSitter.avatarUrl = avatarUrl
        currentSitter.bio = bio
        currentSitter.pricePerHour = pricePerHour

        guard let data = try? JSONEncoder().encode(currentSitter) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .save(data, for: KeyValueStorage.Key.currentSitter)
    }

    /**
     Returns the sitter information that will be displayed in view.

        - Returns: The sitter instance from model layer or new instance of `Sitter`,
     if loading from model layer is failed.
     */
    func getCurrentSitter() -> Sitter {
        loadSitterFromStorage() ?? Sitter()
    }

    // MARK: - Private interface

    private lazy var currentSitter: Sitter = getCurrentSitter()

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
