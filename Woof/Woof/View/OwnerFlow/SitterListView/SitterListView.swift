import SwiftUI

/// A view displaying the list of sitters.
struct SitterListView: View {
    // MARK: - Internal interface

    var body: some View {
        Group {
            if viewModel.errorMessage.isEmpty {
                ScrollView {
                    if viewModel.sitters.isEmpty {
                        Text(noAvailableSittersMessage)
                    }
                    ForEach(viewModel.sitters) { sitter in
                        NavigationLink {
                            DetailPetSitterView(viewModel: DetailSitterViewModel(sitter: sitter))
                        } label: {
                            SitterCardView(viewModel: SitterCardViewModel(sitter: sitter))
                        }
                    }
                }
                .padding(AppStyle.UIElementConstant.minPadding)
            } else {
                VStack(spacing: AppStyle.UIElementConstant.wideSpacingSize) {
                    Text(viewModel.errorMessage)
                    Button(tryAgainButtonText) {
                        Task {
                            await viewModel.fetchSitters()
                        }
                    }.buttonStyle(CapsuleWithWhiteText())
                }
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
                    .foregroundColor(.App.purpleDark)
            }
        }
    }

    // MARK: - Private interface

    /// The view model responsible for providing data to the view.
    @StateObject private var viewModel = SitterListViewModel()

    private let tryAgainButtonText = "Try again"
    private let noAvailableSittersMessage = "There are no available sitters right now."
}

struct SitterListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SitterListView()
        }
    }
}
