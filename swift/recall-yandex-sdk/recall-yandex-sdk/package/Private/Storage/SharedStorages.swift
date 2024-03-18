
enum SharedStorages {
    static let loginResultStorage = SecureStorage<String>(key: "YandexLoginSDKToken")
    static let codeVerifierStorage = SecureStorage<String>(key: "YandexLoginSDKCodeVerifier")
    static let stateStorage = DefaultStorage<Date>(key: "YandexLoginSDKStates")
}
