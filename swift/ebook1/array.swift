let range = 1...10
let range2 = 1...10
range == range2
//range < range2 //wrong

Array(arrayLiteral: 1, 1, 2, 3, 5, 8, 12)

let newAlphabeltArray = Array(arrayLiteral: "a", "b", "c")

let lineArray = Array(0...9)

let repeatArrya = Array(repeating: "Swift", count:5)

let alphabetArray = ["a", "b"]
alphabetArray[1]

let arrayTwo: [Int] = [1, 2, 5, 8]
let arrayOne: Array<Character> = ["a", "b"]

// empty array
let emptyArray: [String] = []

let anotherEmptyArray = [String]()

let charsOne = ["a", "b"]
let charsTwo = ["c", "d"]
charsOne + charsTwo
charsOne.count
charsOne.isEmpty

var numArray = [1, 2, 3, 4, 5]
let sliceOfArray = numArray[numArray.count-3...numArray.count-1]