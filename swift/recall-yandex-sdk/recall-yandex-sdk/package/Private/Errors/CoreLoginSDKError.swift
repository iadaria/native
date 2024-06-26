enum CoreLoginSDKError: YandexLoginSDKError {
    case couldntCreatePKCEFromDictionary(dictionary: [String: Any])
    case couldntFindStateInStatesManager(state: String)
    case loginSDKIsNotActivated
    case userClosedWebViewController
    case urlIsNotRelatedToLoginSDK(url: URL)
    case invalidActivityType(activityType: String, expectedActivityType: String)
    case absentWebPageURLInUserActivity
    case errorParameterInResponseURL(error: String)

    var message: String {
        var message: String

        switch self {
        case let .couldntCreatePKCEFromDictionary(dictionary):
            message = """
            Couldn't create PKCE from Dictionary using init(from:) initializer.
            - dictionary:

            """
            for (key, value) in dictionary {
                message += "    - \(key): \(value)\n"
            }
        case let .couldntFindStateInStatesManager(state):
            message = """
            Received state that doesn't pass validity check in States Manager.
            - invalid state: \(state)
            """
        case .loginSDKIsNotActivated:
            message = """
            Yandex LoginSDK is not activated. \
            Activate SDK using activate(with:) method of YandexLoginSDK shared instance.
            """
        case .userClosedWebViewController:
            message = "User has closed the view controller that presented web authorization content."
        case let .urlIsNotRelatedToLoginSDK(url):
            message = """
            URL is not related to SDK.
            - URL: \(url.absoluteString)
            """
        case let .invalidActivityType(activityType, expectedActivityType):
            message = """
            Invalid activity type in NSUserActivity instance.
            - activity type: \(activityType)
            - expected activity type: \(expectedActivityType)
            """
        case .absentWebPageURLInUserActivity:
            message = "The webPageURL property of an NSUserActivity instance is nil."
        case let .errorParameterInResponseURL(error):
            message = """
            Got an error in response URL parameters.
            - error: \(error)
            """
        }
        return message
    }
}
