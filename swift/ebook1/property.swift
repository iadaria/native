import UIKit

/* Properties of the type. Example. */

struct AudioChannel {
    static var maxVolume = 5
    var volume: Int {
        didSet {
            if self.volume > AudioChannel.maxVolume {
                self.volume = AudioChannel.maxVolume
            }
        }
    }
}
var LeftChannel = AudioChannel(volume: 2)
var RighChannel = AudioChannel(volume: 3)
LeftChannel.volume
RighChannel.volume
LeftChannel.volume

AudioChannel.maxVolume // 5
AudioChannel.maxVolume = 10
AudioChannel.maxVolume //10
RighChannel.volume = 8
RighChannel.volume //8


/* Properties of the type */

struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 2
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 3
    }
    class var overrrideableComputedTypeProperty: Int {
        return 4
    }
}

/* Getter and setter */

struct Circle {
    var coordinates: (x: Int, y: Int)
    //var radius: Float // Change in the next line
    var radius: Float {
        willSet (newValueOfRadius) {
            print("Instead the value: \(radius) will be set the value: \(newValueOfRadius)")
        }
        didSet (oldValueOfRadius) {
            print("The old radius value: \(oldValueOfRadius) was changed to the : \(radius) value")
        }
    }
    var perimeter: Float {
        get {
            return 2.0 * 3.14 * radius
        }
        /*set(newPerimeter) {
            radius = newPerimeter / (2 * 3.14)
        }*/
        set {
            self.radius = newValue / (2 * 3.14)
        }
    }
}
var myNewCircle = Circle(coordinates: (0, 0), radius: 10)
myNewCircle.perimeter
myNewCircle.perimeter = 31.4
myNewCircle.radius // 5

class Person {
    var firstName = "Daria"
    var secondName = "Iakimova"
    lazy var wholeName: String = self.generateWholeName()
    lazy var wholeNameSecond: () -> String = { "\(self.firstName) \(self.secondName)" }
    // the third lazy property
    var wholeNameThird: String { return "\(self.firstName) \(self.secondName)"}
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }

    func generateWholeName() -> String {
        return self.firstName + " " + self.secondName
    }
}

var me = Person(name: "Mitia", secondName: "Iakimov")
me.wholeName
me.wholeNameSecond()
me.wholeNameThird
me.firstName = "Alex"
me.wholeName
me.wholeNameSecond()
me.wholeNameThird
