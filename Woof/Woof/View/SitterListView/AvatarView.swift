import SwiftUI

/// A view displaying an avatar image.
struct AvatarView: View {
    /// The URL of the avatar image.
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .overlay {
                    Circle()
                        .stroke(lineWidth: AppStyle.UIElementConstant.borderStroke)
                }
        } placeholder: {
            Image(systemName: Image.IconName.avatarPlaceholder)
                .resizable()
        }
        .foregroundColor(Color.App.grayDark)
        .scaledToFill()
        .frame(width: AppStyle.UIElementConstant.avatarSideSize, height: AppStyle.UIElementConstant.avatarSideSize)
        .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AvatarView(url: Sitter.Dummy.emilyDoe.avatarUrl)
            AvatarView(url: nil)
        }
    }
}
