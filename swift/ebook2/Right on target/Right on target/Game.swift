//
//  Game.swift
//  Right on target
//
//  Created by Якимова Дарья on 26.02.24.
//

import Foundation

protocol GameProtocol {
    var currentRound: GameRoundProtocol { get }
    var secretValueGenerator: GeneratorProtocol { get }
    var isGameEnded: Bool { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
}

class Game: GameProtocol {
    var secretValueGenerator: GeneratorProtocol
    var currentRound: GameRoundProtocol

    var isGameEnded: Bool {
        return currentRound.isOver()
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        currentRound = GameRound(rounds: rounds)
        secretValueGenerator = Generator(startValue: startValue, endValue: endValue)!
    }
    
    func restartGame() {
        currentRound = GameRound(rounds: 2)
        startNewRound()
    }
    
    func startNewRound() {
        currentRound.currentSecretValue = secretValueGenerator.getRandomValue()
        currentRound.newRound()
    }
}
