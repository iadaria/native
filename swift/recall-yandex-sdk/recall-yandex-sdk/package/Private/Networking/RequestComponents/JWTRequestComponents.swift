struct JWTRequestComponents: RequestComponentsProvider {
    private let token: String

    init(token: String) {
        self.token = token
    }

    var urlAsString: String {
        "https://\(HostProvider.host(for: .login))/info"
    }

    var parameters: [String: String] {
        [
            "aouth_token": token,
            "format": "jwt",
        ]
    }
}
