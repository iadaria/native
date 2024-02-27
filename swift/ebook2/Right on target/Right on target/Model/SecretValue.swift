typealias SecretNumbericValue = SecretValue<Int>
typealias SecretColorValue = SecretValue<Color>

protocol SecretValueProtocol {
    associatedtype ValueType
    var value: ValueType { get }
    mutating func setRandomValue()
}

struct SecretValue<T: Equatable>: SecretValueProtocol {
    // ассоциированный тип, который будет определять тип данных значения
    typealias ValueType = T
    var value: T
    // замыкание для выбора случайного значения
    private let randomValueClousure: (T) -> T
    
    init(initialValue: T, randomValueClosure: @escaping (T) -> T) {
        value = initialValue
        self.randomValueClousure = randomValueClosure
    }
    
    mutating func setRandomValue() {
        self.value = randomValueClousure(self.value)
    }
}
