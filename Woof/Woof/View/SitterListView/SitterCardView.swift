import SwiftUI

struct SitterCardView: View {
    @ObservedObject var viewModel: SitterCardViewModel

    var body: some View {
        ZStack {
            Color.App.grayLight
            HStack {
                AvatarView(url: viewModel.imageURL)

                VStack(alignment: .leading) {
                    GeneralInfoView(
                        fullName: viewModel.fullName,
                        rating: viewModel.rating,
                        price: viewModel.price
                    )
                    BioSectionView(bio: viewModel.bio)
                }
            }
            .padding(.horizontal)
        }
        .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementSize.cornerRadius))
    }
}

struct SitterCardView_Previews: PreviewProvider {
    static var previews: some View {
        SitterCardView( viewModel: SitterCardViewModel(sitter: Sitter.Dummy.emilyDoe))
            .frame(height: 160)
    }
}
