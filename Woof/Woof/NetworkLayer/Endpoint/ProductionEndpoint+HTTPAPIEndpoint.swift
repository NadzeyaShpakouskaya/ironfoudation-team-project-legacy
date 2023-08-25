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
        case .production, .staging: return [Self.authHeader: Self.obfuscatedKey]
        }
    }

    // MARK: - Private interface

    private static let baseProdURL = URL(string: "https://woof-app.hasura.app/api/rest/")!
    private static let getAllSittersPath = "pet_sitters/all"
    private static let addNewSitterPath = "pet_sitters/new"
    private static let authHeader = "x-hasura-admin-secret"

    private static var obfuscatedKey: String {
        do {
            // read salt
            // read obfuscated key
            return try Obfuscator.reveal("", salt: "")
        } catch {}

        return ""
    }
}