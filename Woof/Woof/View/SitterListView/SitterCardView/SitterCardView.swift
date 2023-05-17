import SwiftUI

/// A view displaying information about a sitter.
struct SitterCardView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: SitterCardViewModel

    var body: some View {
        HStack {
            AvatarView(url: viewModel.imageURL)

            VStack(alignment: .leading) {
                GeneralInfoSectionView(
                    fullName: viewModel.fullName,
                    rating: viewModel.rating,
                    price: viewModel.price
                )
                BioSectionView(bio: viewModel.bio)
            }
        }
        .padding()
        .background(Color.App.grayLight)
        .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
    }
}

struct SitterCardView_Previews: PreviewProvider {
    static var previews: some View {
        SitterCardView(viewModel: SitterCardViewModel(sitter: Sitter.Dummy.emilyDoe))
            .frame(height: 160)
    }
}
