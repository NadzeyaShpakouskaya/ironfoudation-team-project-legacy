import Foundation

///  Defines the production endpoints for the Woof app's API.
enum WoofProductionEndpoint {
    // MARK: - Internal interface

    /// The production base URL of the Woof API
    static let baseURL = URL(string: "https://woof-app.hasura.app/api/rest/")!

    /// The authentication header used for making requests to the Woof API.
    static var authHeader: String {
        // obfuscate header
        ""
    }

    /// The key used for authentication with the Woof API.
    static var key: String {
        // obfuscate key
        ""
    }

    // MARK: - Private interface

    private static let obfuscateHeader: [UInt8] = []
    private static let obfuscatedKey: [UInt8] = []
}
