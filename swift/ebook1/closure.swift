import UIKit

/* Даем замыканию выйти за пределы области видимости функции*/
var arrayOfClosures: [() -> Int] = []
//func addNewClosureInArray(_ newClosure: () -> Int) { //error
func addNewClosureInArray(_ newClosure: @escaping () -> Int) {
    arrayOfClosures.append(newClosure)
}
addNewClosureInArray({ return 100})
// тк у функции один входной параметр можно записать так
addNewClosureInArray{return 1000}
arrayOfClosures[0]()
arrayOfClosures[1]()


/* Автозамыкания */
var arrayOfNames = ["Helga", "Bazil", "Alex"]
func printName(nextName: String) {
    print(nextName)
}
printName(nextName: arrayOfNames.remove(at: 0))

// Ленивые вычисления - вычисляем лишь тогда, когда это понадобиться
// То есть, выполняется только когда к нему обратяться
// А не в тот момент, когда передается
func printNameLazy(nextName: () -> String) {
    print(nextName())
}
// Жаль, что нужно использовать фигурные скобки, но можем использовать автозамыкание
printNameLazy(nextName: { arrayOfNames.remove(at: 0)})

// Перепишем и реализуем автозамыкание

func printNameAuto(nextName: @autoclosure () -> String) {
    print(nextName())
}
printNameAuto(nextName: arrayOfNames.remove(at: 0))

/* Захват вложенных функций */

func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

var incrementByTen = makeIncrement(forIncrement: 10)
var incrementBySeven = makeIncrement(forIncrement: 7)
incrementByTen() //10
incrementByTen() //20
incrementByTen() //30
incrementBySeven() //7
incrementBySeven() //14

/* Передаем замыкания по ссылке */

var incrementByFive = makeIncrement(forIncrement: 5)
var copyIncrementByFive = incrementByFive
incrementByFive() // 5
copyIncrementByFive() //10

/* Захват переменных */

var a = 1
var b = 2
let closureSum: () -> Int = {
    a + b
}
closureSum() // 3
a = 3
b = 4
closureSum() // 7

// делаем захват - фиксируем их на момент захвата
var a2 = 1
var b2 = 2
let closureSum2: () -> Int = { [a2, b2] in
    a2 + b2
}
closureSum2() // 3
a2 = 3
b2 = 4
closureSum2() // 3


//
let array = [1, 44, 81, 4, 277, 50, 101, 51, 8]
var sortedArray = array.sorted(by: { (first: Int, second: Int) -> Bool in
    return first < second
})
sortedArray

var sortedArraySimplified = array.sorted(by: { $0 < $1 })
sortedArraySimplified

// Убираем номера параметров
var sortedArrayMoreSimplified = array.sorted(by: <)
sortedArrayMoreSimplified


let closurePrint: (String) -> Void = {text in
    print(text)
}
closurePrint("Hi there")

// нет return тк тело состоит из одного выражения
// Подчеркивания занчат, что мы можем опускать имена функции при ее вызове, что мы и сделали
var sum: (_ numOne: Int, _ numTwo: Int) -> Int = {
    $0 + $1
}
sum(10, 34)


let functionInLet = { return true }
functionInLet()

var wallet = [10, 50, 100, 100, 5000, 100, 50, 50, 500, 100]

func handle100(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    
    for banknote in wallet {
        if banknote == 100 {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}
func handleMore1000(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    
    for banknote in wallet {
        if banknote >= 1000 {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}


handle100(wallet: wallet)
handleMore1000(wallet: wallet)

func handle(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if closure(banknote) {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}

func compare100(banknote: Int) -> Bool {
    return banknote == 100
}

func compareMore1000(banknote: Int) -> Bool {
    return banknote >= 1000
}

let resultWalletOne = handle(wallet: wallet, closure: compare100)
let resultWalletTwo = handle(wallet: wallet, closure: compareMore1000)

handle(wallet: wallet, closure: { (banknote: Int) -> Bool in return banknote >= 1000})
handle(wallet: wallet, closure: { (banknote: Int) -> Bool in return banknote == 100})
handle(wallet: wallet, closure: { banknote in return banknote >= 1000})
// Неявно возвращаем значение, если тело замыкающего выражения содержит одно выражение(без return)
handle(wallet: wallet, closure: { banknote in banknote >= 1000})
// Без имен входных параметров, просто нумеруем их:$0, $1, ... $N
handle(wallet: wallet, closure: {$0>=1000})
// Можно вынести тело замыкающего входного параметра функции в списке выходных параметров функции
handle(wallet: wallet) {$0 >= 1000}
// То же, только многострочный вариант closure - здесь удобно, что можно выносить
let walletOne = handle(wallet: wallet) { banknote in
    for number in Array(arrayLiteral: 100, 500) {
        if number == banknote {
            return true
        }
    }
    return false
}
walletOne

let walletTwo = handle(wallet: wallet) { [100, 500].contains($0)}
walletTwo

// С версии 5.3 Swift можно выносить все замыкания за скобки, находящиеся в конце списка аргументов.
func networkQuery(url: String, success: (String) -> (), error: (Int) -> ()) {
    // code
}

networkQuery(url: "https://weather.com", success: { data in }, error: { errorCode in})
networkQuery(url: "https://weather.com") { data in } error: { errorCode in }

let closure: () -> Void = {
    print("Hi there")
}
closure()

