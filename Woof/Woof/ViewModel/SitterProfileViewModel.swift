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

    /// Indicating the status of the saving operation.
    @Published var isSavingData = false

    /**
     Initializes an instance of the `SitterProfileViewModel` class.
     */
    init() {
        currentSitter = loadSitterFromStorage()

        setInitialValues(currentSitter)
    }

    /// Requests model layer to upload and save modified data.
    @MainActor func save() async {
        isSavingData = true

        var updatedSitter = currentSitter

        updatedSitter.name = name
        updatedSitter.surname = surname
        updatedSitter.phone = phone
        updatedSitter.bio = bio
        updatedSitter.pricePerHour = Double(pricePerHour) ?? currentSitter.pricePerHour

        do {
            try await upload(updatedSitter)
            currentSitter = updatedSitter
            try await saveLocally(currentSitter)
        } catch {
            handleError(error)
        }

        isSavingData = false
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

        do {
            _ = try await NetworkService<WoofAppEndpoint>().request(endpoint)
        } catch {
            throw AppError.uploadFailed
        }
    }

    private func saveLocally(_ sitter: Sitter) async throws {
        guard let data = try? JSONEncoder().encode(sitter),
              KeyValueStorage(KeyValueStorage.Name.currentSitter)
              .save(data, for: KeyValueStorage.Key.currentSitter) else {
            throw AppError.saveLocallyFailed
        }
    }

    @MainActor private func handleError(_ error: Error) {
        guard let appError = error as? AppError else {
            errorMessage = "An error occurred."
            return
        }

        errorMessage = appError.errorDescription
    }

    private func loadSitterFromStorage() -> Sitter {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter),
            let sitter = try? JSONDecoder().decode(Sitter.self, from: data) else {
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
