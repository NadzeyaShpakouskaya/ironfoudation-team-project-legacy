import Foundation
import NetworkService

///  Defines the production endpoints for the Woof app's API.
extension ProductionEndpoint: HTTPAPIEndpoint {
    // MARK: - Internal interface

    typealias Environment = APIEnvironment

    static var networkEnvironment = Environment.production

    var baseURL: URL {
        Self.baseProdURL
    }

    var path: String {
        switch self {
        default: return ""
        }
    }

    var task: HTTPTask {
        switch self {
        default: return .request
        }
    }

    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }

    var headers: HTTPHeaders {
        switch self {
        default: return [Self.Environment.authHeader: Self.Environment.obfuscatedKey]
        }
    }

    // MARK: - Private interface

    private static let baseProdURL = URL(string: "https://woof-app.hasura.app/api/rest/")!
}
