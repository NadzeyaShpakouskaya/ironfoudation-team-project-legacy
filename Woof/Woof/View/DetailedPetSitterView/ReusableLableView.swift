import SwiftUI

/// A view displaying a section for the detailed sitter's information.
struct ReusableLableView: View {
    /// The name of an icon.
    let image: String
    /// The informational text to be displayed.
    let message: String

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius)
                .padding(.horizontal)
                .overlay(
                    HStack {
                        Image(systemName: image)
                            .foregroundColor(Color.App.purpleDark)
                        Text(message)
                            .foregroundColor(Color.App.grayDark)
                            .fontWeight(.bold)
                    }
                )
        }.foregroundColor(Color.App.white)
    }
}

struct ContactDetailsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableLableView(image: Image.IconName.fullName, message: "Full Name")
    }
}
