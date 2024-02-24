import UIKit

struct NetworkError: Error {
    var code: Int
    func description() -> String {
        return "it is network error with code \(code)"
    }
}

do {
    throw NetworkError(code: 404)
} catch let error as NetworkError {
    print(error.description())
} catch is NetworkError {
    print("it is a network error")
} catch {
    print("hi there")
}

func someThrowingFunction() throws -> Int {
    throw VendingMachineError.outOfStock
}

let y = try! someThrowingFunction()
y

let x = try? someThrowingFunction()
x

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeed: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeed: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy BAr"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid selection")
} catch VendingMachineError.outOfStock {
    print("There is no goods")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Need more money You need \(coinsNeeded) coins")
}

enum CustomError: Error {
    case wrongName
}

func funcTrowsError() throws {
    throw CustomError.wrongName
}

func funcGetsError() throws -> String {
    try funcTrowsError()
    return "TextResult"
}

try funcGetsError()

enum FileError: Error {
    case notExists
    case notRights
}

let accountBalans = 10
let productPrice = 20

guard productPrice <= accountBalans else {
    let diff = productPrice - accountBalans
    throw VendingMachineError.insufficientFunds(coinsNeed: diff)
}
