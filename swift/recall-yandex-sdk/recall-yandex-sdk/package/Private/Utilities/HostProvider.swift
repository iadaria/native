enum HostType {
    case oauth, login, pssp
}

enum HostProvider {
    static func host(for hostType: HostType) -> String {
        let inTestEnironment = YandexLoginSDK.isInTestEnvironment
        
        switch hostType {
        case .oauth:
            return inTestEnironment ? "oauth-test.yandex.ru" : "oauth.yandex.ru"
        case .login:
            return inTestEnironment ? "login-test.yandex.ru" : "login.yandex.ru"
        case .pssp:
            return inTestEnironment ? "loginsdk.passport-test.yandex.ru" : "loginsdk.passport.yandex.ru"
        }
    }
}
