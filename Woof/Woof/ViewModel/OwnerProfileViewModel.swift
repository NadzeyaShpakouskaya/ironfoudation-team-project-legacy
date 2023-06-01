import Foundation

final class OwnerProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var phone: String = ""
    @Published var address: String = ""
    @Published var avatarURL: URL?
    @Published var error: DataError?
    
    /**
     Initializes an instance of the `OwnerCardViewModel` class, loads the owner object from user defaults if it exists.
     */
    init() {
        name = currentOwner.name
        surname = currentOwner.surname
        phone = currentOwner.phone
        address = currentOwner.address
        avatarURL = currentOwner.avatarUrl
    }
    
    /// Saves the owner's property to storage.
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

enum DataError: Error {
    case decodeDataError
    case encodeDataError
    case loadDataError
    case saveDataError
}
