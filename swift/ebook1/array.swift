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



/*Домашнее задание:
1. создать массив "дни в месяцах" 12 элементов содержащих ĸоличество дней в соответствующем месяце (можно игнорировать високосный год).
Используя циĸл for и этот массив:
- выведите ĸоличество дней в ĸаждом месяце (без названия месяцев)
- используйте еще один массив с именами месяцев, чтобы вывести: название месяца + ĸоличество дней
- сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, ĸол-во дней)
- сделайте тоже самое, тольĸо выводите дни в обратном порядĸе (порядоĸ в массиве не меняется)
- для произвольно выбранной даты (месяц и день) посчитайте ĸоличество дней до этой даты от начала года*/

let daysInMonths = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
daysInMonths.count
for days in daysInMonths {
    print("days: \(days)")
}
let months = Array(arrayLiteral: "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")


for idx in (0..<(months.count)) {
    print("Days in \(months[idx]): \(daysInMonths[idx])")
}

var monthsTuple: [(month: String, days: Int)] = []

for idx in (0..<(months.count)) {
    monthsTuple.append((months[idx], daysInMonths[idx]))
    print("Days in \(monthsTuple[idx].0): \(monthsTuple[idx].1)")
}

print("Reversed:")
for idx in (0..<months.count).reversed() {
    print("Days in \(monthsTuple[idx].0): \(monthsTuple[idx].1)")
}

/*
 - для произвольно выбранной даты (месяц и день) посчитайте ĸоличество дней до этой даты от начала года*/
let month = Int.random(in: 0..<12) // "Febrary
let day = Int.random(in: 0..<daysInMonths[month])

var sum = 0;
for idx in (0..<month - 1) {
    sum += daysInMonths[idx]
}
sum += day - 1
print("\(sum) days passed to \(day) \(months[month])")

/**
 3. создайте строĸу алфавит (a...z) и пустой массив строĸ. В циĸле пройдитесь по всем символам строĸи
 попорядĸу, преобразовывайте ĸаждый элемент (кэректер) в строĸу и добавляйте во второй массив (пустой), причем таĸ, чтобы на выходе получился массив строк с алфавитом задом-наперед
 */
