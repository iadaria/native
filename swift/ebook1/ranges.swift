import UIKit

let rangeInt: Range<Int> = 1..<5
for i in rangeInt {
    print(i)
}
type(of: rangeInt)

let rangeString = "a"..<"z"
type(of: rangeString)

let rangeDouble = 1.0..<5.0
type(of: rangeDouble)

let firstElement = 10
var lastElement = 18
let myBestRange = firstElement..<lastElement

let oneSideRange = ..<5
type(of: oneSideRange)

let myRange = 1...100
myRange.count
myRange.contains(4)
for i in myRange { print(i) }

let myRange2 = 2...
let collection = [1, 2 ,5, 11, 20]
print( collection[myRange2])

let myRange3 = ...0

//without elements
let emptyR = 0..<0
emptyR.count
emptyR.isEmpty

// with a single element
let notEmptyR = 0...0
notEmptyR.count
notEmptyR.isEmpty

let anotherIntR = 20..<34
anotherIntR.lowerBound
anotherIntR.upperBound
anotherIntR.min()
anotherIntR.max()
anotherIntR.hashValue // Hashable

let range = 1...10
let range2 = 1...10
range == range2
//range < range2 //wrong
