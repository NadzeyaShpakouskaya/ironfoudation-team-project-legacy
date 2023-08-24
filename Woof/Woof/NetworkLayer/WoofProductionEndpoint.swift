import Foundation
import NetworkService

///  Defines the production endpoints for the Woof app's API.
enum WoofProductionEndpoint: HTTPAPIEndpoint {
    typealias Environment = APIEnvironment

    // MARK: - Internal interface

    /// Request to get a list of the available sitters from endpoint.
    case getSitters

    /// Request to add or update, if the sitter already exists, information about sitter on the endpoint.
    case addNew(sitter: Sitter)

    static var networkEnvironment = Environment.production

    var baseURL: URL {
        Self.baseProdURL
    }

    var path: String {
        switch self {
        case .getSitters: return Self.getAllSittersPath
        case .addNew(_): return Self.addNewSitterPath
        }
    }

    var task: HTTPTask {
        switch self {
        case .getSitters: return .request
        case let .addNew(sitter): return .requestWithBodyParameters(bodyParameters: ["\(sitter.id)": sitter])
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getSitters: return .get
        case .addNew(_): return .post
        }
    }

    var headers: HTTPHeaders {
        switch Self.networkEnvironment {
        case .production: return [Self.authHeader: Self.authKey ?? ""]
        case .staging: return [Self.authHeader: Self.authKey ?? ""]
        }
    }

    // MARK: - Private interface

    private static let baseProdURL = URL(string: "https://woof-app.hasura.app/api/rest/")!
    private static let getAllSittersPath = "pet_sitters/all"
    private static let addNewSitterPath = "pet_sitters/new"
    private static let authHeader = "x-hasura-admin-secret"
    private static let obfuscatedHeader = ""
    private static let obfuscatedKey = ""
    private static let authKey = try? Obfuscator.reveal("", salt: "")
}

enum APIEnvironment {
    case production
    case staging
}
