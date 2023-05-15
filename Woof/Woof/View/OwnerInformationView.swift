import SwiftUI

/// A view representing the view of pet Owner profile information.
struct OwnerInformationView: View {
    var body: some View {
        ScrollView {
            OwnerCardView()
        }
        .background(Color.App.grayLight)
    }
}

struct OwnerInformation_Previews: PreviewProvider {
    static var previews: some View {
        OwnerInformationView()
    }
}
