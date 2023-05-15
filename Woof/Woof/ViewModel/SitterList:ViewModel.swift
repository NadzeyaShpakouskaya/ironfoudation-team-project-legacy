import Foundation

/// Responsible for preparing and providing data for the `SitterListView`.
final class SitterListViewModel: ObservableObject {
    /// The sequence of sitters to display in view.
    @Published var sitters: [Sitter] = []

    /// Initializes a new instance of the `SitterListViewModel`
    init() {
        // stub to load dummy sitter list
        sitters = Sitter.Dummy.sitters
    }
}
