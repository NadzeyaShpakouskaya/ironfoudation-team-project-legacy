import SwiftUI

/// A view displaying the list of sitters.
struct SitterListView: View {
    var body: some View {
        Group {
            switch viewModel.state {
            case .inProgress:
                ProgressView()
                    .foregroundColor(.App.purpleDark)
            case .loaded:
                ScrollView {
                    ForEach(viewModel.sitters) { sitter in
                        NavigationLink {
                            DetailPetSitterView(viewModel: DetailSitterViewModel(sitter: sitter))
                        } label: {
                            SitterCardView(viewModel: SitterCardViewModel(sitter: sitter))
                        }
                    }

                }.padding(AppStyle.UIElementConstant.minPadding)
            default:
                VStack(spacing: wideSpacingSize) {
                    Text(errorMessage)
                    Button(tryAgainButtonText) {
                        Task {
                            await viewModel.fetchSitters()
                        }
                    }.buttonStyle(CapsuleWithWhiteText())
                }
            }
        }
    }

    // MARK: - Private interface

    /// The view model responsible for providing data to the view.
    @StateObject private var viewModel = SitterListViewModel()

    private let errorMessage = "Couldn't load data"
    private let tryAgainButtonText = "Try again"
    private let wideSpacingSize = 20.0
}

struct SitterListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SitterListView()
        }
    }
}
