import Foundation

/// Represents custom error that can occur in the Woof app.
enum AppError: Error, CaseIterable {
    /// An error when attempting to save data locally on the user's device.
    case saveLocallyFailed
    /// An error when attempting to upload data to the remote server.
    case uploadFailed

    /// An error when the internet connection is missing
    case noInternetConnection

    /// An error when attempting to load data from the remote server.
    case downloadFailed

    /// Text description of possible errors.
    var errorDescription: String {
        switch self {
        case .saveLocallyFailed:
            return "Oops! We couldn't save your data on your device."
        case .uploadFailed:
            return "Oops! We couldn't upload your data to our server."
        case .noInternetConnection:
            return "Something wrong. Check your internet connection."
        case .downloadFailed:
            return "Oops! We couldn't load data from our server."
        }
    }
}
