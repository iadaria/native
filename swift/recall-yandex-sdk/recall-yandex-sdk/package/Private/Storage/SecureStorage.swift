import Foundation

struct SecureStorage<Value: Codable>: Storage {
    
    typealias ObjectValue = Value
    
    private let keychainQueryBase: [CFString: Any]
    
    init(key: String) {
        self.keychainQueryBase = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: key,
            kSecAttrAccount: key
        ]
    }
    
    func laodObject() throws -> [String: Value] {
        var query = keychainQueryBase
        query[kSecReturnData] = true
        query[kSecMatchLimit] = kSecMatchLimitOne
        
        var object: AnyObject? = nil
        SecItemCopyMatching(query as CFDictionary, &object)
        
        guard let object else { throw StorageError.nilObjectReturnedFromSecureStorage }
        
        
    }
}
