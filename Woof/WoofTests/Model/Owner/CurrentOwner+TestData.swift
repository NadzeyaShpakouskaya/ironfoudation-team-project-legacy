import Foundation

extension Owner.CurrentOwner {
    /// Interface with test values for unit tests.
    enum TestData {
        /// The instance of owner using in unit test as a default instance.
        static let defaultOwner = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "123",
            avatarUrl: nil,
            address: "address",
            rating: 3.5
        )

        /// The instance of owner used as changed (updated) owner information.
        static let updatedOwner = Owner(
            name: "Aleks",
            surname: "Peterson",
            phone: "237647",
            avatarUrl: nil,
            address: "home sweet home",
            rating: 4.6
        )
        /// The name for test storage used in unit-tests
        static let storageName = "Test-Owner-Storage"
    }
}
