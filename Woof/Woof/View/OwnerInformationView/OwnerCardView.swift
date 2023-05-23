import SwiftUI

/// A view that displays the profile information of an Owner.
struct OwnerCardView: View {
    /// View model responsible for managing the data for the owner card.
    @ObservedObject var viewModel = OwnerCardViewModel()
    /// Tracks whether the card is in edit mode or not.
    @State private var isEditMode: Bool = false

    var body: some View {
        ZStack {
            Group {
                if isEditMode {
                    EditView(viewModel: viewModel)
                } else {
                    CardInfoView(viewModel: viewModel)
                }
            }
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        if isEditMode {
                            viewModel.save()
                        }
                        isEditMode = !isEditMode
                    }, label: {
                        Text(isEditMode ? "Save" : "Edit")
                    })
                    .buttonStyle(DefaultAppButtonStyle())
                    .disabled(viewModel.owner.name.isEmpty)
                    Spacer()
                }
            }
        }.padding()
            .frame(maxWidth: .infinity)
            .background(Color.App.purpleLight)
            .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
            .foregroundColor(.App.white)
    }
}

struct OwnerCardView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerCardView()
    }
}

struct CardInfoView: View {
    var viewModel: OwnerCardViewModel

    var body: some View {
        HStack {
            AvatarView(url: viewModel.owner.avatarUrl)

            VStack(alignment: .leading) {
                Text(viewModel.owner.name)
                    .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                Text(viewModel.owner.surname)
                    .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                Text(viewModel.owner.phone)
                    .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
                Text(viewModel.owner.address)
                    .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
            }
            Spacer()
        }
    }
}

struct EditView: View {
    @ObservedObject var viewModel: OwnerCardViewModel

    var body: some View {
        VStack {
            Text("Edit your information")
            TextField("Name", text: $viewModel.owner.name)
            TextField("Surname", text: $viewModel.owner.surname)
            TextField("Phone", text: $viewModel.owner.phone)
            TextField("Address", text: $viewModel.owner.address)

            if viewModel.owner.name.isEmpty {
                Text("*Name is a mandatory field")
            }
        }
        .foregroundColor(.App.purpleDark)
        .textFieldStyle(.roundedBorder)
    }
}
