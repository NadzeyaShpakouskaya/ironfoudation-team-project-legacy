import SwiftUI

/// A view displaying an icon and the portion of text.
struct TextWithIconLabelView: View {
    /// The name of the icon that the label displays.
    let iconName: String

    /// The text that the label displays.
    let text: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.App.purpleDark)
            Text(text)
                .foregroundColor(.App.grayDark)
                .fontWeight(.bold)
                .lineLimit(1)
        }
        .padding(.vertical, AppStyle.UIElementConstant.minPadding)
        .frame(maxWidth: .infinity)
        .background(Color.App.white)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
    }
}

struct ContactDetailsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TextWithIconLabelView(
            iconName: Image.IconName.filledPerson,
            text: "Arnold Schwarzenegger"
        )
    }
}
