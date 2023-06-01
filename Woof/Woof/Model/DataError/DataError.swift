import Foundation

/// Errors that may occur when working with data.
enum DataError: Error {
    /// The error during the decode process.
    case decodeDataError
    
    /// The error during the encode process.
    case encodeDataError
    
    /// The error during the load process.
    case loadDataError
    
    /// The error during the save process.
    case saveDataError
}
