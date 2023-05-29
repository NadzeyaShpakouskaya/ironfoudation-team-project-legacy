extension KeyValueStorage {
    /// A test storage to use in the unit tests.
    static var test: KeyValueStorage {
        KeyValueStorage("Test-KeyValue-Storage")
    }

    /**
     Removes the associated data for all the test keys.
     If some test key isn’t found, method does nothing for that key.
     */
    func deleteDataForAllTestKeys() {
        KeyValueStorage.TestKey.allCases.forEach {
            self.deleteData(for: $0.rawValue)
        }
    }
}
