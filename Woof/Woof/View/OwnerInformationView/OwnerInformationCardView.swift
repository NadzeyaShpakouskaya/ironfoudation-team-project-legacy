import SwiftUI

/// A view to present the owner information.
struct OwnerInformationCardView: View {
    /// The name of the owner
    let name: String
    
    /// The surname of the owner
    let surname: String
    
    /// The phone of the owner
    let phone: String
    
    /// The address of the owner
    let address: String
    
    /// The URL of the avatar image of the owner.
    let avatarUrl: URL?

    var body: some View {
        HStack {
            AvatarView(url: avatarUrl)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                Text(surname)
                    .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                Label(phone, systemImage: Image.IconName.phone)
                    .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
                Label(address, systemImage: Image.IconName.house)
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
}

struct OwnerInformationCardView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerInformationCardView(
            name: Owner.Dummy.emilyDoe.name,
            surname: Owner.Dummy.emilyDoe.surname,
            phone: Owner.Dummy.emilyDoe.phone,
            address: Owner.Dummy.emilyDoe.address,
            avatarUrl: nil
        )
    }
}
