import SwiftUI

/// A type that applies standard interaction behavior and a custom appearance to all buttons within a view hierarchy.
/// The button will have a capsule shape of the specified color.
/// The button will have a label with the white center-aligned text.
/// The button size will adjust to the length of the text.
///
/// To configure the current button style for a view hierarchy, use the `buttonStyle(_:)` modifier.
struct CapsuleWithWhiteText: ButtonStyle {
    /// A background color.
    let backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .foregroundColor(Color.App.white)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

struct CapsuleWithWhiteText_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me!") {}
            .buttonStyle(
                CapsuleWithWhiteText(
                    backgroundColor: Color.App.purpleDark
                )
            )
    }
}
