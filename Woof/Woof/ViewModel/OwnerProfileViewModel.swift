import Foundation

/// The view model for a owner profile view that is responsible for preparing and providing data for it.
final class OwnerProfileViewModel: ObservableObject {
    /// The name of owner
    @Published var name: String = ""
    
    /// The surname of owner
    @Published var surname: String = ""
    
    /// The phone number of owner
    @Published var phone: String = ""
    
    /// The home address of owner
    @Published var address: String = ""
    
    /// The URL of the owner's avatar image.
    @Published var avatarURL: URL?
    
    /// The error occurs during work with the model layer
    @Published var error: DataError?
    
    /**
     Initializes an instance of the `OwnerProfileViewModel` class.
     */
    init() {
        name = currentOwner.name
        surname = currentOwner.surname
        phone = currentOwner.phone
        address = currentOwner.address
        avatarURL = currentOwner.avatarUrl
    }
    
    /// Request model layer to save modified data.
    func save() {
        currentOwner.name = name
        currentOwner.surname = surname
        currentOwner.phone = phone
        currentOwner.address = address
        currentOwner.avatarUrl = avatarURL
        
        guard let data = try? JSONEncoder().encode(currentOwner) else {
            error = .encodeDataError
            return
        }
        
        guard KeyValueStorage(KeyValueStorage.StorageName.ownerStorage)
            .save(data, for: KeyValueStorage.Key.ownerKey) != true else {
            error = .saveDataError
            return
        }
    }
    
    // MARK: - Private interface
    private lazy var currentOwner: Owner = loadOwnerFromStorage() ?? Owner()
    
    private func loadOwnerFromStorage() -> Owner? {
        guard let data = KeyValueStorage(KeyValueStorage.StorageName.ownerStorage)
            .loadData(for: KeyValueStorage.Key.ownerKey) else {
            error = .loadDataError
            return nil
        }
        guard let owner = try? JSONDecoder().decode(Owner.self, from: data) else {
            error = .decodeDataError
            return nil
        }
        
        return owner
    }
}

