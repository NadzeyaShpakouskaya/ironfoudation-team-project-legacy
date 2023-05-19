import SwiftUI

/// A view displaying a section for the detailed sitter's information.
struct ReusableLabelView: View {
    /// The name of an icon.
    let image: String
    /// The informational text to be displayed.
    let message: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(Color.App.purpleDark)
            Text(message)
                .foregroundColor(Color.App.grayDark)
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
        ReusableLabelView(image: Image.IconName.filledPerson, message: "Full Name")
    }
}
