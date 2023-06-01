import SwiftUI

/// A view displaying information about the pet owner.
struct OwnerCardView: View {
    /// The name of the pet owner.
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

            VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.vStackSpacing) {
                Group {
                    Text(name)
                    Text(surname)
                }
                .font(
                    .system(
                        size: AppStyle.FontStyle.heading.size,
                        weight: .heavy
                    ))
                Group {
                    Label(phone, systemImage: Image.IconName.phone)
                    Label(address, systemImage: Image.IconName.house)
                }
                .font(
                    .system(
                        size: AppStyle.FontStyle.body.size,
                        weight: .bold
                    )
                )
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

struct OwnerCardView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerCardView(name: "sdf", surname: "dfdf", phone: "3435", address: "weg", avatarUrl: nil)
    }
}
