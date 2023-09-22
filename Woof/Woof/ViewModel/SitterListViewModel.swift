import Foundation

/// An interface is responsible for preparing and providing data for the `SitterListView`.
final class SitterListViewModel: ObservableObject {
    /// The list of sitters to show.
    @Published var sitters: [Sitter] = []

    /// The state of loading data from server.
    @Published var state = LoadingState.notInitiated

    /// Initializes a new instance of the `SitterListViewModel`
    init() {
        Task {
            await fetchSitters()
        }
    }

    @MainActor func fetchSitters() async {
        state = .inProgress
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            sitters = Sitter.Dummy.sitters
        } catch {
            state = .loadingFailed
        }
        state = .loaded
    }
}
