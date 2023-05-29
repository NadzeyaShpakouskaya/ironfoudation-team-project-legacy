import Foundation

extension Owner {
    /**
     A private nested struct that handles the retrieval of the current owner.
     */
    struct CurrentOwner {
        // MARK: - Public Interface

        init(_ storageName: String) {
            storage = KeyValueStorage(storageName)
        }

        /**
         Retrieves the current owner.

         - Returns: An instance of `Owner` representing the current owner.
         If no owner is found, a new `Owner` instance is returned.
         */
        func get() -> Owner {
            getOwner() ?? Owner()
        }

        /**
         Saves provided instance of owner to storage.

         - Parameter owner: The instance of current owner to save.

         - Returns: `True` if the provided instance was successfully encoded and saved to storage,
         otherwise `false.`
         */
        func update(with owner: Owner) -> Bool {
            guard let data = try? JSONEncoder().encode(owner) else {
                return false
            }

            guard let result = storage?.save(data, for: ownerKey) else {
                return false
            }

            return storage?.save(data, for: ownerKey) ?? false
        }

        func delete() {
            storage?.deleteData(for: ownerKey)
        }

        // MARK: - Private Interface

        /**
         Retrieves the owner from storage.

         - Returns: An instance of `Owner` if successfully retrieved and decoded from storage,
         otherwise `nil`.
         */
        private func getOwner() -> Owner? {
            guard let data = storage?.loadData(for: ownerKey) else {
                return nil
            }
            guard let owner = try? JSONDecoder().decode(Owner.self, from: data) else {
                return nil
            }

            return owner
        }

        private var storage: KeyValueStorage?
        private let ownerKey = "owner"
    }
}
