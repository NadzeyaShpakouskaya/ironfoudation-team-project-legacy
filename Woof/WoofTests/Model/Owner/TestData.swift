import Foundation

extension Owner.CurrentOwner {
    enum TestData {
        static let owner = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "123",
            avatarUrl: URL(string: "test url"),
            address: "address",
            rating: 3.5
        )

        static let storageName = "Test-Owner-Storage"
    }
}
