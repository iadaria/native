import UIKit

let possibleString = "1945"
let convertPossibleString = Int(possibleString)
type(of: possibleString)
type(of: convertPossibleString)

// Формы записи
// 1
let optionalChar: Optional<Character> = "a"
// 2
var xCoordinate: Int? = 12
// 3
var optionalVar = Optional("stringValue")
optionalVar = nil

var tuple: (code: Int, message: String)? = nil
type(of: tuple)

let tupleWithoptelements: (Int?, Int) = (nil, 100)
tupleWithoptelements.0
tupleWithoptelements.1

let optVar: Int? = 4
let b: Int = 5
// a + optVar //error
let result = optVar! + b
type(of: optVar!)

let my: String? = nil
//my! //error

var wrapInt: Double! = 3.14
wrapInt + 0.12

var fiveMarkCount: Int? = 8
var allCakesCount = 0
type(of: allCakesCount)
if fiveMarkCount != nil {
    let cakeForEachFiveMark = 2
    allCakesCount = cakeForEachFiveMark * fiveMarkCount!
}

// Optional binding
let markCount: Int? = 8
if let marks = markCount {
    print("There are only \(marks) marks")
}

var pointX: Int? = 10
var pointY: Int? = 3

if let x = pointX, let y = pointY {
    print("The point has been set on ?")
}

if let _ = pointX, let _ = pointY {
    print("The point has been set on ?")
}

if let x = pointX, x > 5 {
    print("The point is very far from you")
}

