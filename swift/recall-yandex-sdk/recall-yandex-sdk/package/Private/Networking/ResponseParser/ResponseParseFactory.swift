enum ResponseParseFactory {
    static func parse(for components: any RequestComponentsProvider) -> (any ResponseParser)? {
        switch components {
        case is JWTRequestComponents:
            return JWTResponseParser()
        case is TokenRequestComponents:
            return TokenResponseParser()
        default:
            return nil
        }
    }
}
