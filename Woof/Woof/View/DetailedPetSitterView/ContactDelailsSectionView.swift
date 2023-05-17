import SwiftUI

/// A view displaying a section for the detailed sitter's information.
struct ContactDelailsSectionView: View {
    /// The name of an icon.
    let image: String
    /// The informational  text to be displayed.
    let message: String

    var body: some View {
        RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius)
            .padding(.horizontal)
            .frame(height: AppStyle.UIElementConstant.frameContactDetailsSectionHeight)
            .overlay(HStack {
                Image(systemName: image)
                Text(message)
                    .foregroundColor(Color.App.grayDark)
                    .fontWeight(.bold)
            }.foregroundColor(Color.App.purpleDark))
            .foregroundColor(Color.App.white)
    }
}

struct ContactDetailsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDelailsSectionView(image: Image.IconName.fullName, message: "Full Name")
    }
}
