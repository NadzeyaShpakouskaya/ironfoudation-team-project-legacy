import SwiftUI

struct DefaultAppButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 60)
            .font(.system(size: AppStyle.FontStyle.body.size, weight: .bold))
            .foregroundColor(.App.white)
            .background(Color.App.purpleDark)
            .clipShape(Capsule())
    }
}
