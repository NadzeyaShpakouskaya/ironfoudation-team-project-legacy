import Foundation

extension Owner {
    enum Dummy {
        static let emilyDoe = Owner(
            name: "Emily",
            surname: "Doe",
            phone: "6734828993487",
            avatarUrl: Bundle.main.url(forResource: "EmilyDoeAvatar", withExtension: "jpg"),
            address: "My town, Happiness str. 24-67",
            rating: 3.8
        )
    }
}
