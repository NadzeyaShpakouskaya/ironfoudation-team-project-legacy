import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel
    var body: some View {
        ZStack {
            Color.App.grayLight
                .ignoresSafeArea()
            VStack {
                AvatarView(url: viewModel.imageURL)
                RatingView(rating: .constant(viewModel.rating))
                ReusableLableView(image: Image.IconName.fullName, message: viewModel.fullName)
                ReusableLableView(image: Image.IconName.phone, message: viewModel.phoneNumber)
                Text(viewModel.bio)
                    .padding()
                Spacer()
            }
        }
    }

    struct DetailPetSitterView_Previews: PreviewProvider {
        static var previews: some View {
            DetailPetSitterView(
                viewModel: DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe)
            )
        }
    }
}
