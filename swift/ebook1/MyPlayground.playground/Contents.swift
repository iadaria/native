import Foundation

let urlEncoding: [Character: String] = ["+": "-", "/": "_", "=": ""]
print(urlEncoding)

let data = "abd".data(using: .utf8)!
print(data)
let base64 = data.base64EncodedString() + "+"
print(base64)
let base65Encoded = base64.reduce("") { $0 + (urlEncoding[$1] ?? String($1))}
print(base65Encoded)

var systemInfo = utsname()
systemInfo

uname(&systemInfo)

let machine = systemInfo.machine

let mirro = Mirror(reflecting: machine)
let cString = mirro.children.compactMap { $0.value as? CChar }
let model = String(cString: cString)

model

public enum AuthorizationStrategy {
    case `default`, webOnly, primaryOnly
}

AuthorizationStrategy.default



enum ApplicationPrimacy: String {
    case primary, secondary
}

let app1 = ApplicationPrimacy.primary
app1

var parameters: [AuthorizationStrategy: String] {
    var parameters: [AuthorizationStrategy: String] = [
        .webOnly: "hi",
        .primaryOnly: "bye",
    ]
    
    return parameters
}

for (key, value) in parameters {
    print(key)
    print(value)
}
