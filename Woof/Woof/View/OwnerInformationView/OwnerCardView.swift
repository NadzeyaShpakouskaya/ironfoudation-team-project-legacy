import SwiftUI

/// A view that displays the profile information of an Owner.
struct OwnerCardView: View {
    /// View model responsible for managing the data for the owner card.
    @ObservedObject var viewModel = OwnerCardViewModel()
    /// Tracks whether the card is in edit mode or not.
    @State private var isEditMode: Bool = false

    var body: some View {
        VStack {
            HStack {
                Image(systemName: Image.IconName.avatarPlaceholder)
                    .resizable()
                    .frame(width: AppStyle.UIElementConstant.avatarCardSideSize,
                           height: AppStyle.UIElementConstant.avatarCardSideSize)
                    .foregroundColor(.App.purpleDark)

                VStack(alignment: .leading) {
                    Group {
                        TextField("Name", text: $viewModel.owner.name)
                            .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                            .foregroundColor(.App.white)

                        TextField("Surname", text: $viewModel.owner.surname)
                            .font(.system(size: AppStyle.FontStyle.heading.size, weight: .heavy))
                            .foregroundColor(.App.white)

                        TextField("Phone", text: $viewModel.owner.phone)
                            .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
                            .foregroundColor(.App.white)

                        TextField("Address", text: $viewModel.owner.address)
                            .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
                            .foregroundColor(.App.white)
                    }
                    .disabled(!isEditMode)
                    .background(isEditMode ? .App.purpleDark : Color.clear)

                    if !isEditMode {
                        HStack {
                            ForEach(1...5, id: \.self) { index in
                                Image(systemName: index <= Int(viewModel.owner.rating) ?
                                    Image.IconName.filledStar : Image.IconName.unfilledStar)
                                    .foregroundColor(.App.purpleDark)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10.0)

                Button(action: {
                    viewModel.save()
                    isEditMode = !isEditMode
                }, label: {
                    Text(isEditMode ? "Save" : "Edit")
                        .fontWeight(.bold)
                        .foregroundColor(.App.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.App.white, lineWidth: 2)
                        )
                })
                .padding(.all, 10.0)
                .cornerRadius(10)
            }
            .padding()
            .background(Color.App.purpleLight)
            .cornerRadius(10)
        }
        .shadow(color: .App.grayDark, radius: 5)
        .padding()
    }
}

struct OwnerCardView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerCardView()
    }
}
