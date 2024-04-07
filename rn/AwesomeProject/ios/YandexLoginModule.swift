@objc(YandexLoginModule)
class YandexLoginModule: NSObject {
  @objc
  static public var viewController: UIViewController?

  @objc
  func login(_ parentViewController: UIViewController, resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        print("hi there")
    
    
      
        resolve(["token": "123", "expiresIn": "456"])
    }

  @objc
  func constantsToExport() -> [String: Any]! {
      return ["someKey": "someValue"]
  }
}
