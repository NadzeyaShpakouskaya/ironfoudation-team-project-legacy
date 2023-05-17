import SwiftUI

/// A view displaying the list of sitters.
struct SitterListView: View {
    /// The view model responsible for providing data to the view.
    @State private var viewModel = SitterListViewModel()

    var body: some View {
        ScrollView {
            ForEach(viewModel.sitters) { sitter in
                SitterCardView(viewModel: SitterCardViewModel(sitter: sitter))
            }
        }
        .padding(AppStyle.UIElementConstant.minPadding)
    }
}

struct SitterListView_Previews: PreviewProvider {
    static var previews: some View {
        SitterListView()
    }
}
