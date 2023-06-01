import Foundation

extension Owner {
    enum Test {
        static let kateAnderson = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "phone",
            avatarUrl: Bundle.main.url(forResource: "JohnAlisonAvatar", withExtension: "jpg"),
            address: "test address",
            rating: 3.2
        )
    }
}
