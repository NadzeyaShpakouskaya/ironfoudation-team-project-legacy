import SwiftUI

/// A type that applies standard interaction behavior and a custom appearance to all buttons within a view hierarchy.
/// The button will have a dark purple capsule shape.
/// The button will have a label with bold white center-aligned text.
/// The button will have an infinity width.
///
/// To configure the current button style for a view hierarchy, use the `buttonStyle(_:)` modifier.
struct PurpleCapsuleOfInfinityWidth: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(
                .system(
                    size: AppStyle.FontStyle.body.size,
                    weight: .bold
                )
            )
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.App.white)
            .background(Color.App.purpleDark)
            .clipShape(Capsule())
    }
}

struct PurpleCapsuleOfInfinityWidth_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me!") {}
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
    }
}
