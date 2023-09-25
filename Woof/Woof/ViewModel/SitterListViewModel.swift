import Foundation
import NetworkService

/// An interface is responsible for preparing and providing data for the `SitterListView`.
final class SitterListViewModel: ObservableObject {
    // MARK: - Internal interface

    /// The list of sitters to show.
    @Published var sitters: [Sitter] = []

    /// The state of loading data from server.
    @Published var state = LoadingState.notInitiated

    /// Fetches data about sitters from the remote server.
    @MainActor func fetchSitters() async {
        state = .inProgress
        do {
            let data = try await NetworkService().request(WoofAppEndpoint.getAllSitters)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let allSittersResponse = try decoder.decode(AllSittersResponse.self, from: data)

            if let sitters = allSittersResponse.petSitters {
                self.sitters = sitters
            }
        } catch {
            state = .loadingFailed
        }
        state = .loaded
    }
}
