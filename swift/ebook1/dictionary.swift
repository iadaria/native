let dictionary = ["one": "the first", "two": "the second", "three": "the third"]
dictionary

Dictionary(dictionaryLiteral: (100, "hundred"), (200, "two hundred"), (300, "three hundred"))

let baseCollection = [(2, 5), (3, 6)]
let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)

let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A",
"Alpha Centauri B"]
// массив расстояний до звезд
let nearestStarDistances = [4.24, 4.37, 4.37]
// получение словаря, содержащего пары значений
let starDistanceDict = Dictionary(uniqueKeysWithValues: zip(nearestStarNames,nearestStarNames))

let dictOne: Dictionary<Int,Bool> = [100: false, 200: true, 400: true]
let dictTwo: [String:String] = ["Jonh":"Dave", "Eleonor":"Green"]

var countryDict = ["RUS": "Россия", "BEL": "Белоруссия", "UKR": "Украина"]
// получаем значение элемента
var countryName = countryDict["BEL"]
countryName // "Белоруссия"
// изменяем значение элемента
countryDict["RUS"] = "Российская Федерация"
var oldValueOne = countryDict.updateValue("Республика Беларусь", forKey: "BEL")
// в переменной записано старое измененное значение элемента
oldValueOne // "Белоруссия"
var oldValueTwo = countryDict.updateValue("Эстония", forKey: "EST")
// в переменной записан nil, так как элемента с таким ключом не существует
oldValueTwo // nil

countryDict["TUR"] = nil
countryDict.removeValue(forKey: "BEL")

let emptyDictionary: [String:Int] = [:]
let anotherEmptyDictionary = Dictionary<String,Int>()


var emptyDict: [String:Int] = [:]
emptyDict.count // 0
emptyDict.isEmpty // true

// все значения словаря countryDict
let values = countryDict.values
type(of: values) // Dictionary<String, String>.Values.Type
values // Dictionary.Values(["Украина", "Эстония", "Российская Федерация"])