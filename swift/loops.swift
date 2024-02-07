import UIKit

var firstLogicVar = true
var secondLogicVar = false

if firstLogicVar || secondLogicVar, !firstLogicVar {}

if (..<5).contains(4) {
    
} else if (5...7).contains(4) {
    
}

let x = 111
let y = (x > 100 ? 100 : 50)
print(y)

let a = 1
let b = 2
a <= b ? print("a") : print ("b")

if let a = Int("43"), let b = Int("45"), a < b {
    print("a < b")
}

let userMark = 4
switch userMark {
case 1..<3:
    print("You didn't pass the exam")
case 4...5:
    print("You passed the exam")
default:
    assert(false, "You entered a wrong grade")
}

let dragonCharacteristics: (color: String, weight: Float) = ("красный", 1.4)
let dragonCount = 3
// 1
switch dragonCharacteristics {
case ("зеленый", 0..<2):
    print("#1")
case ("красный", 0...) where dragonCount < 5 && dragonCharacteristics.weight.truncatingRemainder(dividingBy: 1) == 0:
    print("#2")
default:
    print("default")
}
// 2
switch dragonCharacteristics {
case ("зеленый", 0..<2):
    print("#1")
case ("красный", let weight) where dragonCount == 3 && weight >= 2:
    print("#2")
default:
    print("default")
}

let level: Character = "Б"
// определение уровня готовности
switch level {
case "А":
print("Выключить все электрические приборы ")
fallthrough
case "Б":
print("Закрыть входные двери и окна ")
fallthrough
case "В":
print("Соблюдать спокойствие")
default:
break
}

// начальное значение
var y2 = 1
// хранилище результата сложения
var result = 0
// цикл для подсчета суммы
repeat {
result += y
y2 += 1
} while y <= 10
result // 5

for _ in 1...3 {
    print("Hi there")
}

var countriesAndBlocks = ["Россия": "СНГ", "Франция": "ЕС"]
for (countryName, _) in countriesAndBlocks {
print("страна — \(countryName)")
}
for (_, orgName) in countriesAndBlocks{
print("организация — \(orgName)")
}

countriesAndBlocks = ["Россия": "ЕАЭС", "Франция": "ЕС"]
for countryName in countriesAndBlocks.keys {
print("страна — \(countryName)")
}
for orgName in countriesAndBlocks.values {
print("организация — \(orgName)")
}

print("Несколько фактов обо мне:")
let myMusicStyles = ["Rock", "Jazz", "Pop"]
for (index, musicName) in myMusicStyles.enumerated() {
print("\(index+1). Я люблю \(musicName)")
}

for i in stride( from: 1, through: 10, by: 3 ) {
// тело оператора
    print(i)
}

var result2 = 0
for i in stride( from: 1, through: 1000, by:2 ) {
result2 += i
}


var result = 0
for i in 1...10 where i % 2 == 0 {
result += i
}
result // 30

var isRun = true
for i in 1...10 where isRun {
// тело оператора
}

