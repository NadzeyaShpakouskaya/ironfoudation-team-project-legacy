import SwiftUI

/// A view representing the view of pet Owner's profile information.
struct OwnerInformationView: View {
    var body: some View {
        ScrollView {
            OwnerCardView()
                .padding(.horizontal)
        }
        .background(Color.App.grayLight)
    }
}

struct OwnerInformation_Previews: PreviewProvider {
    static var previews: some View {
        OwnerInformationView()
    }
}