import Foundation

public final class YandexLoginSDK: NSObject {
    public enum AuthorizationStrategy {
        case `default`, webOnly, primaryOnly
    }
    
    static var isInTestEnvironment: Bool {
        Bundle.main.infoDictionary?["YandexLoginSDKUseTestEnvironment"] as? Bool ?? false
    }
}
