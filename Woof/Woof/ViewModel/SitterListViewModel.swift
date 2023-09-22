import Foundation
import NetworkService

/// An interface is responsible for preparing and providing data for the `SitterListView`.
final class SitterListViewModel: ObservableObject {
    // MARK: - Internal interface

    /// The list of sitters to show.
    @Published var sitters: [Sitter] = []

    /// Fetches data about sitters from the remote server.
    func fetchSitters() async {
        do {
            let data = try await NetworkService().request(WoofAppEndpoint.getAllSitters)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedResponseData = try decoder.decode([String: [Sitter]?].self, from: data)

            guard decodedResponseData.count == 1,
                  let sitters = decodedResponseData.values.first as? [Sitter] else { return }

            await MainActor.run { self.sitters = sitters }
        } catch { return }
    }
}
