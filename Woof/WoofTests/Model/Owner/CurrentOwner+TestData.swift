import Foundation

extension Owner.CurrentOwner {
    enum TestData {
        static let defaultOwner = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "123",
            avatarUrl: nil,
            address: "address",
            rating: 3.5
        )

        static let updatedOwner = Owner(
            name: "Aleks",
            surname: "Peterson",
            phone: "237647",
            avatarUrl: nil,
            address: "home sweet home",
            rating: 4.6
        )

        static let storageName = "Test-Owner-Storage"
    }
}
