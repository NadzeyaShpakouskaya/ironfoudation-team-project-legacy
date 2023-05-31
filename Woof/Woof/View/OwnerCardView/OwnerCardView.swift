import SwiftUI

/// A view displaying  information about the pet owner.
struct OwnerCardView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: OwnerCardViewModel

    var body: some View {
        HStack {
            AvatarView(url: viewModel.imageURL)

            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.fullName)
                    .font(
                        .system(
                            size: AppStyle.FontStyle.heading.size, weight: .heavy
                        ))
                    .lineLimit(1)
                    .foregroundColor(.App.white)
                LabelWithTextAndImage(
                    iconName: Image.IconName.phone,
                    text: viewModel.phoneNumber
                )
                LabelWithTextAndImage(
                    iconName: Image.IconName.house,
                    text: viewModel.address
                )
            }
            Spacer()
        }
        .padding()
        .background(Color.App.purpleLight)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
        .frame(maxWidth: .infinity)
    }

    struct OwnerCardView_Previews: PreviewProvider {
        static var previews: some View {
            OwnerCardView(
                viewModel: OwnerCardViewModel(owner: Owner.Dummy.laraCroft))
        }
    }
}
