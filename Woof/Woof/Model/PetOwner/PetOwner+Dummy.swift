import Foundation
extension Owner {
    enum Dummy {
        static let laraCroft = Owner(
            id: UUID(),
            name: "Lara",
            surname: "Croft",
            phone: "6734828993487",
            avatarUrl: Bundle.main.url(forResource: "EmilyDoeAvatar", withExtension: "jpg"),
            address: "My town, Happiness str. 24-67",
            rating: 4.8
        )
    }
}
