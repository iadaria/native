let mySet: Set = [1, 5, 0]
let mySet2 = Set<Int>(arrayLiteral: 5, 66, 211)
let mySet3 = Set(arrayLiteral:5, 66, 211)

var dishes: Set<String> = ["apple", "bottle of whater"]
var members = Set<String>(arrayLiteral: "apple", "bread")

// empty set
let emptySet = Set<String>()
dishes = []

//base properties and methods
dishes.insert("tea")
dishes
dishes.remove("Tea")
dishes.removeAll()
dishes.contains("Tea")