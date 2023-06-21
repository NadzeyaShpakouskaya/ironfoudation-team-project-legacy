import NetworkService

/// Stub network service to check the integration of `NetworkService` package.
struct NetworkServiceStub {
    /// Check the proper integration of `NetworkService` package.
    func foo() {
        NetworkService().testUse()
    }
}
