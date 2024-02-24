import UIKit

protocol NamedTwo {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: NamedTwo, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: NamedTwo & Aged) {
    print("Happy birthday, \(celebrator.name)! You are alrady \(celebrator.age)!")
}

let birthdayPerson = Person(name: "Iad", age: 27)
wishHappyBirthday(celebrator: birthdayPerson)



protocol SuperProtocol {}
protocol SubProtocol: AnyObject, SuperProtocol {}

class ClassWithProtocol: SubProtocol {} // correct
// struct StructWithProtocol: SubProtocol {} // error

protocol GeometricFigureWithXAxis {
    var x: Int { get set }
}

protocol GeomtricFigureWithYAxis {
    var y: Int { get set }
}

protocol GeomtricFigure: GeomtricFigureWithYAxis, GeometricFigureWithXAxis {
    var distanceFromCenter: Float { get }
}

struct Figure2D: GeomtricFigure {
    var distanceFromCenter: Float {
        let xPow = pow(Double(self.x), 2)
        let yPow = pow(Double(self.y), 2)
        let length = sqrt(xPow + yPow)
        return Float(length)
    }
    
    var y: Int = 0
    
    var x: Int = 0
    
    
}

protocol HasValue {
    var value: Int { get set }
}

class ClassWithValue: HasValue {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

struct StructWithValue: HasValue {
    var value: Int
}

let objects: [Any] = [
    2,
    StructWithValue(value: 3),
    true,
    ClassWithValue(value: 6),
    "Iad"
]

for object in objects {
    if let elementWithValue = object as? HasValue {
        print("The value is \(elementWithValue.value)")
    }
}

for object in objects {
    print(object is HasValue)
}


func getHash<T: Hashable>(of value: T) -> Int {
    return 1
}

getHash(of: 5)
getHash(of: "swift")

protocol Named {
    var name: String { set get }
    init(name: String)
}

class PersonTwo: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    
}

protocol RandomNumberGenerator {
    var randomCollection: [Int] { get set }
    func getRandomNumber() -> Int
    mutating func setNewRandomCollection(newValue: [Int])
}

struct RandomGenerator: RandomNumberGenerator {
    var randomCollection: [Int] = [1, 2, 3, 4, 5]
    
    func getRandomNumber() -> Int {
        if let randomElement = randomCollection.randomElement() {
            return randomElement
        }
        return 0
    }
    
    mutating func setNewRandomCollection(newValue: [Int]) {
        self.randomCollection = newValue
    }
    
    
}

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

struct SomeStruct: SomeProtocol {
    var mustBeSettable: Int
    let doesNotNeedToBeSettable: Int
    func getSum() -> Int {
        return self.mustBeSettable + self.doesNotNeedToBeSettable
    }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get }
}

struct AnotherStruct: SomeProtocol, AnotherProtocol {
    var mustBeSettable: Int
    
    var doesNotNeedToBeSettable: Int
    
    static var someTypeProperty: Int = 3
    
    func getSum() -> Int {
        return self.mustBeSettable
        + self.doesNotNeedToBeSettable
        + AnotherStruct.someTypeProperty
    }
}
