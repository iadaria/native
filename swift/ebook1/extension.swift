import UIKit

protocol Descriptional {
    func getDesciption() -> String
}

extension Descriptional {
    func getDescription() -> String {
        return "Description of object type"
    }
}

// doesn't work anymore
//class myClassTwo: Descriptional{} // error

class myStruct: Descriptional {
    func getDesciption() -> String {
        return "hi there"
    }
}

myStruct().getDescription()


protocol TextRepresentable {
    func asText() -> String
}

extension Int: TextRepresentable {
    func asText() -> String {
        return String(self)
    }
}

5.asText()

extension TextRepresentable {
    func about() -> String {
        return "Text representable"
    }
}

5.about()


extension Int {
    subscript(digitIndex: Int) -> Int {
        var base = 1
        var index = digitIndex
        while index > 0 {
            base *= 10
            index -= 1
        }
        return (self /  base) % 10
    }
}

746381295[0]

struct Line {
    var pointOne: (Double, Double)
    var pointTwo: (Double, Double)
}

extension Double {
    init(line: Line) {
        self = sqrt(
            pow((line.pointTwo.0 - line.pointOne.0), 2) +
            pow((line.pointTwo.1 - line.pointOne.1), 2)
        )
    }
}

var myLine = Line(pointOne: (10, 10), pointTwo: (14,10))
var lineLength = Double(line: myLine)
lineLength

extension Double {
    var asKM: Double { return self / 1000.0 }
    var asM: Double { return self }
    var asCM: Double { return self * 100.0 }
    var asMM: Double { return self * 1000.0 }
    var asFT: Double {
        get {
            return self / 0.3048
        }
        set(newValue) {
            self = newValue * 0.3048
        }
    }
}

let length: Double = 24
length.asKM
length.asMM
var distance: Double = 100
distance.asFT
distance.asFT = 150

extension Int {
    func repetitions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
    
    mutating func squared() {
        self = self * self
    }
}

3.repetitions {
    print("Swift")
}
var someInt = 3
someInt.squared()
