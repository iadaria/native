
@objc(YandexLoginModule)
class YandexLoginModule: NSObject {
    @objc(addEvent:location:date:)
    func addEvent(_ name: String, location: String, date: NSNumber) {
        // Date is ready to use!
    }

    @objc
    func login(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        print("hi there")
        resolve(["token": "123", "expiresIn": "456"])
    }

    @objc
    func constantsToExport() -> [String: Any]! {
        return ["someKey": "someValue"]
    }
}
