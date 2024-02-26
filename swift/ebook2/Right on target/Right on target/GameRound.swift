//
//  GameRound.swift
//  Right on target
//
//  Created by Якимова Дарья on 26.02.24.
//

import Foundation

protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get set }
    // Сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with value: Int)
    func newRound()
    func isOver() -> Bool
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    var rounds: Int
    
    init(rounds: Int) {
        self.rounds = rounds
    }
    
    func isOver() -> Bool { return self.rounds <= 0}
    
    func newRound() { self.rounds -= 1}
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
    
}
