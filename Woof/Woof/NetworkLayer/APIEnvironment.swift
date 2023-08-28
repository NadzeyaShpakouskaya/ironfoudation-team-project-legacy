/// Represents the possible environments for API communication.
enum APIEnvironment {
    /// The production environment for live, real-world data.
    case production

    /// The staging environment for testing and development purposes.
    case staging

    static let authHeader = "x-hasura-admin-secret"

    static var obfuscatedKey: String {
        var key = ""

        do {
            // read salt
            // read obfuscated key
            key = try Obfuscator.reveal("", salt: "")
        } catch {}

        return key
    }
}
