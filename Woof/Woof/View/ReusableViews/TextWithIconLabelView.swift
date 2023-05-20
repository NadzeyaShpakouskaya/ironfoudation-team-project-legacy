import SwiftUI

/// A view displaying a section for the detailed sitter's information.
struct TextWithIconLabelView: View {
    /// The name of an icon.
    let systemIconName: String
    /// The informational text to be displayed.
    let message: String

    var body: some View {
        HStack {
            Image(systemName: systemIconName)
                .foregroundColor(.App.purpleDark)
            Text(message)
                .foregroundColor(.App.grayDark)
                .fontWeight(.bold)
        }
        .padding(.vertical, AppStyle.UIElementConstant.minPadding)
        .frame(maxWidth: .infinity)
        .background(Color.App.white)
        .clipShape(
            RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius)
        )
    }
}

struct ContactDetailsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TextWithIconLabelView(
            systemIconName: Image.IconName.filledPerson,
            message: "Full Name"
        )
    }
}
