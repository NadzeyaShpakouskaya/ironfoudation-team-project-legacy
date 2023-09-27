import Foundation
import NetworkService

/// An interface is responsible for preparing and providing data for the `SitterListView`.
final class SitterListViewModel: ObservableObject {
    // MARK: - Internal interface

    /// The list of sitters to show.
    @Published var sitters: [Sitter] = []

    /// Indicates if loading data is in progress.
    @Published var isLoading = false {
        didSet {
            errorMessage = isLoading ? "" : errorMessage
        }
    }

    /// Detailed error information for the user.
    @Published var errorMessage: String = ""

    init() {
        Task {
            await fetchSitters()
        }
    }

    /// Fetches data about sitters from the remote server.
    func fetchSitters() async {
        await MainActor.run { isLoading = true }

        do {
            let data = try await NetworkService().request(WoofAppEndpoint.getAllSitters)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let allSittersResponse = try decoder.decode(AllSittersResponse.self, from: data)

            if let sitters = allSittersResponse.petSitters {
                await MainActor.run {
                    self.sitters = sitters
                }
            }
        } catch {
            let error = (error as? URLError)?.code == .notConnectedToInternet
                ? AppError.noInternetConnection
                : AppError.downloadFailed

            await MainActor.run { handleError(error) }
        }

        await MainActor.run { isLoading = false }
    }

    // MARK: - Private interface

    @MainActor private func handleError(_ error: Error) {
        guard let appError = error as? AppError else {
            errorMessage = "An error occurred."
            return
        }

        errorMessage = appError.errorDescription
    }
}
