import NetworkService
///  Defines the production endpoints for the Woof app's API.
enum WoofAppEndpoint {
    /// Adding a new pet sitter.
    case addNewSitter(BodyParameters?)
}
