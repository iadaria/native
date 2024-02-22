import UIKit
/** map, mapValues **/

/* map */

let mayArray = [2, 4, 5, 7]
var newArray = mayArray.map{$0}
newArray

// the same
let array = [2, 4, 5, 7]
var newArrayTwo = array.map({
    (value: Int) -> Int in
    return value
})
newArrayTwo

// the same
var newArrayThree = array.map{value in value}
newArrayThree

var newArrayFour = array.map{$0*$0}
newArrayFour

// Changing type of elements
let intArray = [1, 2, 3, 4]
let boolArray = intArray.map{$0 > 2}
boolArray

// Create multiple array
let numbers = [1, 2, 3, 4]
let mapped = numbers.map { Array(repeating: $0, count: $0)}
mapped

//
let milesToDest = ["Moscow" : 120.0, "Dubai": 50.0, "Paris": 70.0]
let kmToDest = milesToDest.map { name, miles in [name:miles * -1.609]}
kmToDest

/* mapValues */
let mappedCloseStars = ["Proxima Centauri": 4.24, "Alpha Centauri A": 4.37]
let newCollection = mappedCloseStars.mapValues{ $0+1 }
newCollection

/* flatMap(_:) */

let numbersArray = [1, 2, 3, 4]
let flatMapped = numbersArray.flatMap { Array(repeating: $0, count: $0) }
flatMapped // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

let someArray = [[1, 2, 3, 4, 5], [11, 44, 1, 6], [16, 403, 321, 10]]
let filterSomeArray = someArray.flatMap{$0.filter{$0 % 2 == 0}}
filterSomeArray //[2, 4, 44, 6, 16, 10]

let stringArray = ["1", "2", "3", "four", "5"]
let intFromStringArray = stringArray.map() { Int($0) }
intFromStringArray // [1, 2, 3, nil, 5]

let arrayWitoutNil = stringArray.compactMap() { Int($0) }
arrayWitoutNil // [1, 2, 3, 5]

/* filter(_:) */
let numArray = [1, 4, 10, 15]
let even = numbers.filter{ $0 % 2 == 0}
even //[4, 10]

let starDistanceDict = ["Wolf 359": 7.78, "Alpha Centauri B": 4.37, "Barnard'sStar": 5.96]
let closeStars = starDistanceDict.filter { $0.value < 5.0 }
closeStars // ["Alpha Centauri B": 4.37]

/* reduce(_:_:) */
let cash = [10, 50, 100, 500]
let total = cash.reduce(210, +) // 870

let multiTotal = cash.reduce(210, { $0 * $1 })
multiTotal
let multiTotalTwo = cash.reduce(210, { $0 * $1 })
multiTotalTwo

let ConsOne = cash.reduce(210, {a, b in a-b})
ConsOne
let ConsTwo = cash.reduce(210, -)
ConsTwo

/* zip(_: _:) */

let collectionOne = [1, 2, 3]
let collectionTwo = [4, 5, 6]
let zipSequence = zip(collectionOne, collectionTwo)
zipSequence

Array(zipSequence)

let newDictionary = Dictionary(uniqueKeysWithValues: zipSequence)
newDictionary

func countSidesOfShape(shape: String) -> Int? {
    switch shape {
    case "t": return 3;
    case "c": return 4;
    case "p": return 4;
    default:
        return nil;
    }
}

func maybePrintCountSides(shape: String) {
    if let sides = countSidesOfShape(shape: shape) {
        print("Shape \(shape) has \(sides) sides")
    } else {
        print("No metter \(shape)")
    }
}

maybePrintCountSides(shape: "t")
maybePrintCountSides(shape: "s")

//Если опциональное связывание успешно завершается, то тело guard игнорируется
//и выполняет следующий за ним код.
func maybePrintCountSidesTwo(shape: String) {
    guard let sides = countSidesOfShape(shape: shape) else {
        print("no metter \(shape)")
        return
    }
    print("Shape \(shape) has \(shape) sides.")
}

maybePrintCountSidesTwo(shape: "t")
maybePrintCountSidesTwo(shape: "k")

/* defer */
func someFunction() {
    defer {
        print("action in defer")
    }
    defer {
        print("another action in defer")
    }
    print("action in function")
}

someFunction()
