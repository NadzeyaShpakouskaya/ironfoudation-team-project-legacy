import Foundation
import NetworkService

/// An interface is responsible for preparing and providing data for the `SitterListView`.
final class SitterListViewModel: ObservableObject {
    // MARK: - Internal interface

    /// The list of sitters to show.
    @Published var sitters: [Sitter] = []

    /// The state of loading data from server.
    @Published var state = LoadingState.notInitiated

    init() {
        Task {
            await fetchSitters()
        }
    }

    /// Fetches data about sitters from the remote server.
    func fetchSitters() async {
        await MainActor.run {
            state = .inProgress
        }

        do {
            let data = try await NetworkService().request(WoofAppEndpoint.getAllSitters)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let allSittersResponse = try decoder.decode(AllSittersResponse.self, from: data)

            if let sitters = allSittersResponse.petSitters {
                await MainActor.run {
                    self.sitters = sitters
                    state = .loaded
                }
            }
        } catch {
            await MainActor.run {
                state = .loadingFailed
            }
        }
    }
}
