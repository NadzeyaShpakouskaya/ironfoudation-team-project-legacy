import Foundation

extension Owner {
    /// Interface with test values for unit tests.
    enum Test {
        /// The instance of owner using in unit test as a default instance.
        static let kateAnderson = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "123",
            avatarUrl: nil,
            address: "address",
            rating: 3.5
        )

        /// The instance of owner used as changed (updated) owner information.
        static let aleksPeterson = Owner(
            name: "Aleks",
            surname: "Peterson",
            phone: "237647",
            avatarUrl: nil,
            address: "home sweet home",
            rating: 4.6
        )
    }
}
