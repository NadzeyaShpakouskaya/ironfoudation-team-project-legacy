import SwiftUI

/// Represents the view with the pet owner's profile information.
struct OwnerProfileView: View {
    var body: some View {
        ScrollView {
            OwnerCardView()
                .padding(.horizontal)
        }
        .background(Color.App.grayLight)
    }
}

struct OwnerProfile_Previews: PreviewProvider {
    static var previews: some View {
        OwnerProfileView()
    }
}
