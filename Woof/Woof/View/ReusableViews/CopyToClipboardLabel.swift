import SwiftUI

/// A label consisting of the icon with two docs and the title `Copy`.
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
        CopyToClipboardLabel()
    }
}
