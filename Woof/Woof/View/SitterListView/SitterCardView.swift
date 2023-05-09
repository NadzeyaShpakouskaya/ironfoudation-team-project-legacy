import SwiftUI

struct SitterCardView: View {
    @ObservedObject var viewModel: SitterCardViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.App.grayLight)

            HStack {
                AsyncImage(url: viewModel.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 8.0)
                        }
                } placeholder: {
                    Image(systemName: Image.IconName.avatarPlaceholder)
                        .font(.largeTitle)
                }
                .foregroundColor(Color.App.grayDark)
                .frame(width: 80, height: 80)
                .clipShape(Circle())

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(viewModel.fullName)
                                .textCase(.uppercase)
                            Group {
                                if viewModel.rating == 0 {
                                    Text("Rating n/a")
                                        .font(.headline)
                                } else {
                                    HStack(spacing: 0) {
                                        ForEach(0..<viewModel.rating, id: \.self) { _ in
                                            Image(systemName: Image.IconName.filledStar)
                                        }
                                    }
                                }
                            }.foregroundColor(Color.App.purpleDark)
                        }
                        Spacer()
                        VStack(spacing: 0) {
                            Text(viewModel.price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            Text("per hour")
                                .font(.caption)
                        }
                    }.font(.title3)
                    Text(viewModel.bio)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                }
            }
            .padding(.horizontal)
        }
        .foregroundColor(Color.App.grayDark)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct SitterCardView_Previews: PreviewProvider {
    static var previews: some View {
        SitterCardView(
            viewModel:
            SitterCardViewModel(sitter: Sitter.dummySitter)
        ).frame(height: 160)
    }
}
