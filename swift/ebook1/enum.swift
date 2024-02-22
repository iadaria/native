import UIKit

enum Expression {
    case addition(Int, Int)
    case substraction(Int, Int)
    func evaluate() -> Int {
        switch self {
        case .addition(let left, let right):
            return left + right
        case .substraction(let left, let right):
            return left - right
        }
    }
}

let expr = Expression.addition(4, 4)
expr.evaluate()

enum ExpressionTwo {
    case number(Int)
    indirect case addition(ExpressionTwo, ExpressionTwo)
    indirect case substraction(ExpressionTwo, ExpressionTwo)
    func evaluate(_ expression: ExpressionTwo? = nil) -> Int {
        switch expression ?? self {
        case let .number(value):
            return value
        case let .addition(valueLeft, valueRight):
            return evaluate(valueLeft) + evaluate(valueRight)
        case .substraction(let valueLeft, let valueRight):
            return evaluate(valueLeft) - evaluate(valueRight)
        }
    }
}

let hardExpr = ExpressionTwo.addition(.number(20), .substraction(.number(10), .number(34)))
hardExpr.evaluate()

enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    // property
    var description: String { return self.rawValue }
    func about() {
        print("The enum contains the emojis list")
    }
    func descriptionValue() -> Smile { return self }
    func descriptionRawValue() -> String { return rawValue }
}

let mySmile: Smile = .sorrow
mySmile.description
mySmile.about()
mySmile.descriptionValue()
mySmile.descriptionRawValue()



enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto = 999
}

// Using
let iAmHappy = Smile.joy
iAmHappy.rawValue
iAmHappy

// Initialization
let myPlanet = Planet.init(rawValue: 3) //eath
var anotherPlanet = Planet.init(rawValue: 11) //nil


enum CurrencyUnit {
    case rouble
    case euro
    case ruble, yuan, hryvnia
}

// Using
var roubleCurrency: CurrencyUnit = .rouble
var otherCurrency = CurrencyUnit.euro
otherCurrency = .ruble


type(of: roubleCurrency)
type(of: otherCurrency)

enum AdvancedCurrencyUnit {
    case ruble([String], String)
    case euro([String], String)
}

// the same
enum AdvancedCurrencyUnitTwo {
    enum DollarCountries {
        case usa
        case canada
        case australia
    }

    case ruble(countries: [String], shortName: String)
    case euro(countries: [String], shortName: String)
    case dollar(nation: DollarCountries, shortName: String)
}

let euroCurrency: AdvancedCurrencyUnit = .euro(["German", "France"], "EUR")
let rubleCurrency: AdvancedCurrencyUnitTwo = .ruble(countries: ["Russia", "SNG"], shortName: "RUB")
euroCurrency
rubleCurrency

/* Enum in switch */

let dollarCurrency: AdvancedCurrencyUnitTwo = .dollar(nation: .usa, shortName: "USD")
let australia: AdvancedCurrencyUnitTwo.DollarCountries = .australia

switch dollarCurrency {
case .ruble:
    print("Rouble")
case let .euro(countries, shortname):
    print("Euro. Countries: \(countries). Short name is a \(shortname)")
case .dollar(let nation, let shortName):
    print("Dollar \(nation). Short name is a \(shortName)")
}
