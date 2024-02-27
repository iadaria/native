import UIKit

let t0 = UIColor(red: 0xFF, green: 2, blue: 0, alpha: 1)


let array = ["a", "b", "c", "d", "e", "f"]
let test = Array(0...9).map{ String($0)} + array
let t = test.randomElement()!
type(of: t)
let t2 = String(t)

func generateColor() -> String {
    var color: String = "#"
    for _ in 1...6 {
        color.append(test.randomElement()!)
    }
    return color
}
var colors = [String]()
for _ in 1...6 {
    colors.append(generateColor())
}

let color = generateColor()
print(color)

let color2 = UIColor(named: color)
