import Foundation

extension WoofProductionEndpoint {
    /// Defines different types of requests that can be made to the Woof API.
    enum Request {
        /// A request to get all sitters from the Woof API.
        case getAllSitters

        /// A request to add a new sitter to the Woof API.
        case addNewSitter(Sitter)

        /**
         The corresponding `HTTPRequest` object for the request.

         - Returns: An `HTTPRequest` object representing the API request.
         */
        var request: HTTPRequest {
            switch self {
            case .getAllSitters:
                break
            case .addNewSitter(_):
                break
            }

            return HTTPRequest()
        }
    }
}

struct HTTPRequest {}
