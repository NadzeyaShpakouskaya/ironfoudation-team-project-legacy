/// Represents the loading states of a resource or operation.
enum LoadingState: CaseIterable {
    /// The loading process has not been initiated yet.
    case notInitiated

    /// The loading process is currently in progress.
    case inProgress

    /// The resource or operation has been successfully loaded.
    case loaded

    /// The loading process has failed.
    case loadingFailed
}
