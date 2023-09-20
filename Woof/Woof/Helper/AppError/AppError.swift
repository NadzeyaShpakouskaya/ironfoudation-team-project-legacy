import Foundation

/// Represents custom errors that can occur in the Woof app
enum AppError: Error {
    /// An error when attempting to save data locally on the user's device.
    case localSaveFailed
    /// An error when attempting to upload data to the remote server.
    case uploadFailed

    var errorDescription: String {
        switch self {
        case .localSaveFailed:
            return "Oops! We couldn't save your data on your device."
        case .uploadFailed:
            return "Oops! We couldn't upload your data to our server."
        }
    }
}
