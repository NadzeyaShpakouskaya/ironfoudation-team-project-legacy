import SwiftUI

/// A type that applies standard interaction behavior and a custom appearance to all buttons within a view hierarchy.
/// The button will have a capsule shape.
/// The color of the button will depend on whether it is enabled.
/// The button will be dark purple color if it is enabled, otherwise dark gray.
/// The button will have a label with the white center-aligned text.
/// The button size will adjust to the length of the text.
///
/// To configure the current button style for a view hierarchy, use the `buttonStyle(_:)` modifier.
struct CapsuleWithWhiteText: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .foregroundColor(Color.App.white)
            .background(isEnabled ? Color.App.purpleDark : Color.App.grayDark)
            .clipShape(Capsule())
    }
}

struct CapsuleWithWhiteText_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Press Me!") {}
                .buttonStyle(CapsuleWithWhiteText())
            Button("Press Me!") {}
                .buttonStyle(CapsuleWithWhiteText())
                .disabled(true)
        }
    }
}
