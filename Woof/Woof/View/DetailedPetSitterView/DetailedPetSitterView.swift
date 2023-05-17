import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The full name of the sitter.
    let fullName: String
    /// The phone number of the sitter.
    let phoneNumber: String

    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel
    var body: some View {
        ZStack {
            Color.App.grayLight
                .ignoresSafeArea()
            VStack {
                AvatarView(url: viewModel.imageURL)
                RatingView(rating: .constant(4))
                ContactDelailsSectionView(image: Image.IconName.fullName, message: fullName)
                ContactDelailsSectionView(image: Image.IconName.phone, message: phoneNumber)
                BioSectionView(bio: viewModel.bio)
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
            }
        }
        .ignoresSafeArea()
    }

    struct DetailPetSitterView_Previews: PreviewProvider {
        static var previews: some View {
            DetailPetSitterView(
                fullName: "Kate Anderson",
                phoneNumber: "+886-997-357",
                viewModel: DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe)
            )
        }
    }
}
