///  Defines the production endpoints for the Woof app's API.
enum ProductionEndpoint {
    /// Request to get a list of the available sitters.
    case getSitters

    /// Request to add the information about sitter.
    case addNew(sitter: Sitter)
}
