import SwiftUI

// A view to present the owner information.
struct OwnerCardView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: OwnerCardViewModel

//    /// The name of the owner
//    let fullName: String
//
//    /// The phone of the owner
//    let phone: String
//
//    /// The address of the owner
//    let address: String
//
//    /// The URL of the avatar image of the owner.
//    let avatarUrl: URL?

    var body: some View {
        HStack {
            AvatarView(url: viewModel.imageURL)

            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.fullName)
                    .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy)).lineLimit(1)
                Label(viewModel.phoneNumber, systemImage: Image.IconName.phone)
                    .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))

                Label(viewModel.address, systemImage: Image.IconName.house)
                    .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
            }
            Spacer()
        }
        .padding()
        .background(Color.App.purpleLight)
        .foregroundColor(.App.white)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
        .frame(maxWidth: .infinity)
    }

    struct OwnerCardView_Previews: PreviewProvider {
        static var previews: some View {
            OwnerCardView(viewModel: OwnerCardViewModel(owner: Owner.Dummy.laraCroft))
        }
    }
}
