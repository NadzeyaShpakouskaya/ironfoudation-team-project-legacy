import Foundation

/// An interface is responsible for preparing and providing data for the `SitterListView`.
final class SitterListViewModel: ObservableObject {
    /// The list of sitters to show.
    @Published var sitters: [Sitter] = []

    /// Initializes a new instance of the `SitterListViewModel`
    init() {
        sitters = Sitter.Dummy.sitters
    }
}
