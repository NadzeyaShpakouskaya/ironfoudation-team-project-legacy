import SwiftUI

/// OwnerCardView is a SwiftUI view that displays the profile information in card view style of an Owner.
struct OwnerCardView: View {
    @ObservedObject var viewModel = OwnerCardViewModel()
    @State private var isEditMode: Bool = false

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.App.purpleDark)

                VStack(alignment: .leading, spacing: 5.0) {
                    Group {
                        TextField("Name", text: $viewModel.owner.name)
                            .font(.system(size: 22, weight: .heavy))
                            .foregroundColor(Color.App.white)

                        TextField("Surname", text: $viewModel.owner.surname)
                            .font(.system(size: 22, weight: .heavy))
                            .foregroundColor(Color.App.white)

                        TextField("Phone", text: $viewModel.owner.phone)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.App.white)

                        TextField("Address", text: $viewModel.owner.address)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.App.white)
                    }
                    .disabled(!isEditMode)
                    .background(isEditMode ? Color.App.purpleDark : Color.clear)
                    .foregroundColor(isEditMode ? Color.App.purpleDark : Color.App.purpleDark)

                    HStack(spacing: 1.0) {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= Int(viewModel.owner.rating) ? "star.fill" : "star")
                                .foregroundColor(Color.App.purpleDark)
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
                        .foregroundColor(Color.App.white)
                })
                .padding(.all, 10.0)
                .cornerRadius(10)
            }
            .padding()
            .background(Color.App.purpleLight)
            .cornerRadius(10)
        }
        .shadow(color: Color.App.grayDark, radius: 5)
        .padding()
    }
}

struct OwnerCardView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerCardView()
    }
}
