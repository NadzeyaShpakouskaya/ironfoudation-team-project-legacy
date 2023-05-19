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
                RaitingView(rating: viewModel
                    .rating)
                ReusableLableView(image: Image.IconName.filledPerson, message: viewModel.fullName)
                    .frame(height: AppStyle.UIElementConstant.frameContactDetailsSectionHeight)
                ReusableLableView(image: Image.IconName.phone, message: viewModel.phoneNumber)
                    .frame(height: AppStyle.UIElementConstant.frameContactDetailsSectionHeight)
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
