import SwiftUI

/// A view that displays a text input field with a prompt text message for a user.
struct TextEditorWithPlaceholder: View {
    // MARK: - Private interface

    private let emptyTextEditorOpacity = 0.25
    private let filledTextEditorOpacity = 1.0

    // MARK: - Internal interface

    /// The text to to edit the sitter information, shown in the text input field.
    @Binding var text: String

    /// The text that is shown in the text input field when it’s empty.
    let placeholderText: String

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholderText)
                    .padding(AppStyle.UIElementConstant.spacingBetweenElements)
                    .foregroundColor(Color.gray)
            }
            TextEditor(text: $text)
                .opacity(text.isEmpty ? emptyTextEditorOpacity : filledTextEditorOpacity)
        }
    }
}

struct TextEditorWithPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorWithPlaceholder(
            text: .constant(""),
            placeholderText: "Your Message"
        )
    }
}
