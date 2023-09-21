import Foundation

/// Represents custom error that can occur in the Woof app.
enum AppError: Error {
    /// An error when attempting to save data locally on the user's device.
    case saveLocallyFailed
    /// An error when attempting to upload data to the remote server.
    case uploadFailed

    /// Text description of possible errors.
    var errorDescription: String {
        switch self {
        case .saveLocallyFailed:
            return "Oops! We couldn't save your data on your device."
        case .uploadFailed:
            return "Oops! We couldn't upload your data to our server."
        }
    }
}
