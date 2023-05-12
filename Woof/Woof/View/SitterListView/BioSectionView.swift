import SwiftUI

/// A view displaying a section for the biography information.
struct BioSectionView: View {
    /// The biography text to be displayed.
    let bio: String

    var body: some View {
        Text(bio)
            .foregroundColor(Color.App.grayDark)
            .font(Font.system(size: AppStyle.FontSize.callout))
            .multilineTextAlignment(.leading)
            .lineLimit(3)
    }
}

struct BioSectionView_Previews: PreviewProvider {
    static var previews: some View {
        BioSectionView(bio:
            """
            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
            when an unknown printer took a galley of type and scrambled it to make a type specimen book.
            """
        )
    }
}
