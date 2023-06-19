import Foundation

/// The view model for a pet sitter profile view is responsible for receiving and processing user actions
/// to change model data and passes back the updated model data.
final class SitterProfileViewModel: ObservableObject {
    // MARK: - Internal interface

    /// The name of the pet sitter.
    @Published var name: String = ""

    /// The surname of the pet sitter.
    @Published var surname: String = ""

    /// The phone of the pet sitter.
    @Published var phone: String = ""

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
        bio = currentSitter.bio
        pricePerHour = currentSitter.pricePerHour
    }

    /// Requests model layer to save modified data.
    func save() {
        currentSitter.name = name
        currentSitter.surname = surname
        currentSitter.phone = phone
        currentSitter.bio = bio
        currentSitter.pricePerHour = pricePerHour

        guard let data = try? JSONEncoder().encode(currentSitter) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .save(data, for: KeyValueStorage.Key.currentSitter)
    }

    /**
     Retrieves the current sitter from storage information that will be displayed in the view.

        - Returns: The sitter instance from the storage if loading from the storage was successfully, otherwise new instance of `Sitter`.
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
