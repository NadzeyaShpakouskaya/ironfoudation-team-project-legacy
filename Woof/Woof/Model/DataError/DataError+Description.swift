import Foundation

extension DataError: CustomStringConvertible {
    // For each error type returns the appropriate description
    var description: String {
        switch self {
        case .decodeDataError:
            return "Couldn't decode the provided data."
        case .encodeDataError:
            return "Couldn't encode the provided data."
        case .loadDataError:
            return "Couldn't load the data."
        case .saveDataError:
            return "Couldn't save the provided data."
        }
    }
}
