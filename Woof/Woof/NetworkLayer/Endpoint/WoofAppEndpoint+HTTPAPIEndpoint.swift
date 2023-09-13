import Foundation
import NetworkService

///  Defines the production endpoints for the Woof app's API.
extension WoofAppEndpoint: HTTPAPIEndpoint {
    // MARK: - Internal interface

    typealias Environment = APIEnvironment

    static var networkEnvironment = Environment.production

    var baseURL: URL {
        Self.baseProdURL
    }

    var path: String {
        switch self {
        case .addNewSitter: return EndpointPath.addNewSitter
        }
    }

    var task: HTTPTask {
        switch self {
        case let .addNewSitter(sitter):
            return .requestWithBodyParameters(bodyParameters: sitter.asDictionary())
        }
    }

    var method: HTTPMethod {
        switch self {
        case .addNewSitter: return .post
        }
    }

    var headers: HTTPHeaders {
        switch Self.networkEnvironment {
        case .production:
            return [Self.authHeader: Self.revealedKey]
        case .staging:
            return [:]
        }
    }

    // MARK: - Private interface

    private static let baseProdURL = URL(string: "https://woof-app.hasura.app/api/rest/") ?? Bundle.main.bundleURL
    private static let authHeader = "x-hasura-admin-secret"
    private static let obfuscatedKey = ""
    private static let salt = ""

    private static var revealedKey: String {
        do {
            return try Obfuscator.reveal(obfuscatedKey, salt: salt)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
