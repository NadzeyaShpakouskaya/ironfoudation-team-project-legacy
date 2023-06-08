import SwiftUI

/// A label for user interface items, consisting of an icon with two docs and with title `Copy`.
struct CopyToClipboardLabel: View {
    // MARK: - Internal interface

    var body: some View {
        Label {
            Text(labelText)
        } icon: {
            Image(systemName: String.IconName.doc)
        }
    }

    // MARK: - Private interface

    private let labelText = "Copy"
}

struct CopyToClipboardLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CopyToClipboardLabel()

            Divider()

            CopyToClipboardLabel()
                .foregroundColor(.blue)
                .font(.system(.subheadline))

            Divider()

            CopyToClipboardLabel()
                .foregroundColor(.white)
                .font(.system(.title))
                .padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
