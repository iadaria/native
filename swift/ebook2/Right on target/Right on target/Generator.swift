//
//  Generator.swift
//  Right on target
//
//  Created by Якимова Дарья on 26.02.24.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class Generator: GeneratorProtocol {
    private var minSecretValue: Int
    private var maxSecretValue: Int
    private var secretValue: Int = 0

    
    init?(startValue: Int, endValue: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
    }
    
    func getRandomValue() -> Int {
        secretValue = (minSecretValue...maxSecretValue).randomElement()!
        return (minSecretValue...maxSecretValue).randomElement()!
    }
}
