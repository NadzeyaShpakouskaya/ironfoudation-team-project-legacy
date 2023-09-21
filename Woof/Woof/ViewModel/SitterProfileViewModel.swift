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
    @Published var pricePerHour: String = ""

    /**
     Initializes an instance of the `SitterProfileViewModel` class.
     */

    init() {
        if let sitter = loadSitterFromStorage() {
            currentSitter = sitter
            resetFields()
            sitterIsSet = true
        }
    }

    /// Requests model layer to save modified data.
    func save() {
        var newSitter = Sitter()
        newSitter.name = name
        newSitter.surname = surname
        newSitter.phone = phone
        newSitter.bio = bio
        newSitter.pricePerHour = Double(pricePerHour) ?? 0

        guard let data = try? JSONEncoder().encode(newSitter) else {
            fatalError("Decoding failed.")
        }

        guard KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .save(data, for: KeyValueStorage.Key.currentSitter) else {
            fatalError("Saving to the local storage failed.")
        }

        currentSitter = newSitter
    }

    /// Requests the model layer to cancel the editing mode and restore the original values.
    func cancelEditing() {
        resetFields()
    }

    // MARK: - Private interface

    /// Indicates whether there is a saved sitter.
    private(set) var sitterIsSet = false
    private var currentSitter: Sitter? {
        didSet {
            sitterIsSet = true
        }
    }

    private func loadSitterFromStorage() -> Sitter? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else { return nil }

        return try? JSONDecoder().decode(Sitter.self, from: data)
    }

    private func resetFields() {
        name = currentSitter?.name ?? ""
        surname = currentSitter?.surname ?? ""
        phone = currentSitter?.phone ?? ""
        bio = currentSitter?.bio ?? ""
        if let currentSitter {
            pricePerHour = String(currentSitter.pricePerHour)
        } else {
            pricePerHour = ""
        }
    }
}
