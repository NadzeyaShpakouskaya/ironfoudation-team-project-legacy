import NetworkService
///  Defines the production endpoints for the Woof app's API.
enum WoofAppEndpoint {
    /// Receiving all sitters that are saved on the server.
    case getAllSitters
    /// Adding a new pet sitter.
    case addNewSitter(BodyParameters?)
}
