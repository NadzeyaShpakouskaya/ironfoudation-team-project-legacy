import SwiftUI

/// A view displaying an icon and the portion of text.
struct LabelWithTextAndImage: View {
    /// The name of the icon that the label displays.
    let iconName: String

    /// The text that the label displays.
    let text: String

    var body: some View {
        Label(text, systemImage: iconName)
            .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
            .background(Color.App.purpleLight)
            .foregroundColor(Color.App.white)
    }
}

struct LabelWithTextAndImage_Previews: PreviewProvider {
    static var previews: some View {
        LabelWithTextAndImage(
            iconName: Image.IconName.phone, text: "80965656569"
        )
    }
}
