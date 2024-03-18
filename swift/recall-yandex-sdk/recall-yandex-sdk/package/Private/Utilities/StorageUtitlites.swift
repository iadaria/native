import Foundation

enum StorageUtitlites {
    
    private static let encoder = JSONEncoder()
    private static let decoder = JSONDecoder()
    
    static func archive<Value: Encodable>(_ object: [String: Value]) throws -> Data {
        try encoder.encode(object)
    }
    
    static func unarhive<Value: Decodable>(_ data: Data) throws -> [String: Value] {
        try decoder.decode(Dictionary<String, Value>.self, from: data)
    }
}
