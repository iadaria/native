import YandexLoginSDK

@objc(YandexLoginOrigin)
class YandexLoginOrigin: NSObject {
  @objc(addEvent:location:date:)
  func addEvent(_ name: String, location: String, date: NSNumber) {
      print("Hi there")
  }
  
  @objc(loginWithController: error:)
  static func login(_ parentViewController: UIViewController) throws {
    try YandexLoginSDK.shared.authorize(with: parentViewController)
  }

  @objc(activateWithClientID:error:)
  static func activate(_ clientID: String) throws {
      try YandexLoginSDK.shared.activate(with: clientID)
  }

  @objc(handleOpenURLWithURL: error:)
  static func handleOpenURL(_ url: URL) throws {
      try YandexLoginSDK.shared.handleOpenURL(url)
  }

  @objc(handleUserActivityWithActivity: error:)
  static func handleUserActivity(_ userActivity: NSUserActivity) throws {
      try YandexLoginSDK.shared.handleUserActivity(userActivity)
  }

  @objc(authorize: parentViewController: customeValues:)
  func authorize(
      _ parentViewController: UIViewController,
      customeValues: [String: String]? = nil
  ) throws {
      try YandexLoginSDK.shared.authorize(with: parentViewController)
  }
}
