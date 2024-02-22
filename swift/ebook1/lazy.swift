import UIKit

/* clou*/

var arrayOfNames = ["Helga", "Bazil", "Alex"]
arrayOfNames.count
let nextName = { arrayOfNames.remove(at: 0)}
arrayOfNames.count
nextName()
arrayOfNames.count

let baseCollection = [1, 2, 3, 4, 5, 6]
let myLazyCollection = baseCollection.lazy
type(of:myLazyCollection)
let collection = myLazyCollection.map{$0 + 1}
collection
Array(collection)

let resultCollection = [1, 2, 3, 4, 5, 6].lazy.map{$0 + 1}.filter{$0 % 2 == 0}
resultCollection
Array(resultCollection) // [2, 4, 6]
