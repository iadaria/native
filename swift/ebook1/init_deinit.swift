import UIKit

class SuperClass {
    init?(isNil: Bool) {
        if isNil == true {
            return nil
        } else {
            print("Instance of the class has been created")
        }
    }
    deinit {
        print("Deinit of the superclass")
    }
}

class SubClass: SuperClass {
    deinit {
        print("Deinit of the subclass")
    }
}

var obj = SubClass(isNil: false)
obj = nil

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")

enum TemperatureUnitTwo: Character {
    case Kelvin = "K", Celsisu = "C", Fahrenheit = "F"
}
let fahrenheitUnitTwo = TemperatureUnitTwo(rawValue: "F")
fahrenheitUnitTwo!.hashValue


class Rectangle {
    var height: Int
    var weight: Int
    init?(height h: Int, weight w: Int) {
        self.height = h
        self.weight = w
        if !(h > 0 && w > 0) {
            return nil
        }
    }
}
var rectangle = Rectangle(height: 56, weight: -32) // returned nil
rectangle

class Quadruped {
    var type = "pet"
    var name = "name"
}


class Dog: Quadruped {
    
    override init() {
        super.init()
        self.type = "dog"
    }
    
    convenience init(text: String) {
        self.init()
        print(text)
    }
    
    func bark() {
        print("woof")
    }
    
    func printName() {
        print(self.name)
    }
}

class NoisyDog {}

var someDog = Dog(text: "Instance of the Dog class has been created")


var things = [Any]()
things.append(0)
things.append("Hi there")
things.append(42)
things.append(0.0)
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)"})
things

for thing in things {
    switch thing {
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Troll"))
    default:
        print("something else")
    }
}

let someObjects: [AnyObject] = [Dog(), NoisyDog(), Dog()]

/*for object in someObjects {
    let animalTwo = object as?
    animalTwo
}*/

for object in someObjects {
    guard let animal = object as? Dog else {
        continue
    }
    print(animal)
}
