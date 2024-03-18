import Foundation

enum CryptoUtilities {
    
    static func base64URLEncodeString(from data: Data) -> String {
        let base64 = data.base64EncodedString()
        
        let urlEncoding: [Character: String] = ["+": "-", "/": "_", "=": ""]
        let base64URLEncoded = base64.reduce("") { $0 + (urlEncoding[$1] ?? String($1))}
        
        return base64URLEncoded
    }
}
