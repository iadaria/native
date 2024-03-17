
import Foundation
import UIKit

enum EnvironmentInfo {
    enum Parameter: String {
        case platfrom = "app_platform"
        case manufacturer
        case model
        case deviceName = "device_name"
        case identifierForVendor = "ifv"
        case appID = "app_id"
        case appVersion = "app_version"
    }
    
    static var parametersWithStringKeys: [String: String] {
        var parameters: [String: String] = [:]
        
        for (key, value) in self.parameters {
            parameters[key.rawValue] = value
        }
        
        return parameters
    }
    
    static var parameters: [Parameter: String] {
        var parameters: [Parameter: String] = [
            .platfrom: UIDevice.current.model,
            .manufacturer: "Apple",
            .model: self.model,
            .deviceName: UIDevice.current.name
        ]
        
        if let identifierForVendor = UIDevice.current.identifierForVendor?.uuidString {
            parameters[.identifierForVendor] = identifierForVendor
        }
        
        if let appID = Bundle.main.bundleIdentifier {
            parameters[.appID] = appID
        }
        
        if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            parameters[.appVersion] = appVersion
        }
        
        return parameters
    }
    
    private static var model: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machine = systemInfo.machine
        
        let mirror = Mirror(reflecting: machine)
        let cString = mirror.children.compactMap { $0.value as? CChar }
        let model = String(cString: cString)
        
        return model
    }
}
