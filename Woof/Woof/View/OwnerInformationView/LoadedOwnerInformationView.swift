import SwiftUI

struct LoadedOwnerInformationView: View {
    let name: String
    let surname: String
    let phone: String
    let address: String
    let avatarUrl: URL?

    var body: some View {
        HStack {
            AvatarView(url: avatarUrl)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                Text(surname)
                    .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                Label(phone, systemImage: "phone")
                    .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
                Label(address, systemImage: "house")
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

struct LoadedOwnerInformationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadedOwnerInformationView(
            name: Owner.Dummy.emilyDoe.name,
            surname: Owner.Dummy.emilyDoe.surname,
            phone: Owner.Dummy.emilyDoe.phone,
            address: Owner.Dummy.emilyDoe.address,
            avatarUrl: nil
        )
    }
}
