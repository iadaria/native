import Foundation

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
