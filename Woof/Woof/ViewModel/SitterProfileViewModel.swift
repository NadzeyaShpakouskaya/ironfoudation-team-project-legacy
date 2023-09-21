import Foundation
import NetworkService

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

    /// Indicating whether an error has occurred during the network operation.
    @Published var isErrorOccurred = false

    /**
     Initializes an instance of the `SitterProfileViewModel` class.
     */
    init() {
        currentSitter = loadSitterFromStorage()

        setInitialValues(currentSitter)
    }

    /// Requests model layer to upload and save modified data.
    func save() async {
        var updatedSitter = currentSitter

        updatedSitter.name = name
        updatedSitter.surname = surname
        updatedSitter.phone = phone
        updatedSitter.bio = bio
        updatedSitter.pricePerHour = Double(pricePerHour) ?? currentSitter.pricePerHour

        do {
            try await upload(updatedSitter)

            currentSitter = updatedSitter

            await saveLocally(currentSitter)
        } catch {
            await handleError(.uploadFailed)
        }
    }

    /// Requests the model layer to cancel the editing mode and restore the original values.
    func cancelEditing() {
        setInitialValues(currentSitter)
    }

    // MARK: - Private interface

    private lazy var currentSitter: Sitter = loadSitterFromStorage()

    private(set) var errorMessage = "" {
        didSet {
            isErrorOccurred = !errorMessage.isEmpty
        }
    }

    private func upload(_ sitter: Sitter) async throws {
        let endpoint = WoofAppEndpoint.addNewSitter(sitter.asDictionary())
        _ = try await NetworkService<WoofAppEndpoint>().request(endpoint)
    }

    private func saveLocally(_ sitter: Sitter) async {
        guard let data = try? JSONEncoder().encode(sitter),
              KeyValueStorage(KeyValueStorage.Name.currentSitter)
              .save(data, for: KeyValueStorage.Key.currentSitter) else {
            await handleError(.saveLocallyFailed)
            return
        }
    }

    @MainActor private func handleError(_ error: AppError) {
        errorMessage = error.errorDescription
    }

    private func loadSitterFromStorage() -> Sitter {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else {
            return Sitter()
        }
        guard let sitter = try? JSONDecoder().decode(Sitter.self, from: data) else {
            return Sitter()
        }

        return sitter
    }

    private func setInitialValues(_ currentSitter: Sitter) {
        name = currentSitter.name
        surname = currentSitter.surname
        phone = currentSitter.phone
        bio = currentSitter.bio
        pricePerHour = String(currentSitter.pricePerHour)
        errorMessage = ""
    }
}
