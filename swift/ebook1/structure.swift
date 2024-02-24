import UIKit

struct ChessPlayer {
    var name: String
    var victories: UInt
    var wins: UInt = 0
    
    init(name: String, victories: UInt) {
        self.name = name
        self.victories = victories * 2
    }
    func description() {
        print("Gamer \(self.name) has \(self.victories) victories")
    }
    mutating func addVictoreis(count: UInt = 1) {
        self.victories += count
    }
}

let playerDaria = ChessPlayer.init(name: "Daria Iakimova", victories: 32)
// the same
var playerMitia = ChessPlayer(name: "Mitia", victories: 132)
type(of: playerDaria)
playerMitia.victories
playerMitia.addVictoreis()
playerMitia.victories
playerMitia.addVictoreis(count: 3)
playerMitia.victories
