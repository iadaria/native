import UIKit

class Chessman {
    enum ChessmanType {
        case king, castle, bishop, pawn, knight, queen
    }
    enum ChessmanColor {
        case black, white
    }
    
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        figureSymbol = figure
    }
    init(type: ChessmanType, color: ChessmanColor, figure: Character, coordinates: (String, Int)) {
        self.type = type
        self.color = color
        figureSymbol = figure
        setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    func setCoordinates(char c:String, num n: Int) {
        coordinates = (c, n)
    }
    func kill() {
        coordinates = nil
    }
}
// создаем экземпляр фигуры
var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}")
print(kingWhite.figureSymbol)
kingWhite.setCoordinates(char: "E", num: 1)

class GameDesk {
    var desk: [Int: [String:Chessman]] = [:]
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    subscript(alpha: String, number: Int) -> Chessman? {
        get {
            return self.desk[number]![alpha]
        }
        set {
            if let chessman = newValue {
                self.setChessman(chess: chessman, coordinates: (alpha, number))
            } else {
                self.desk[number]![alpha] = nil
            }
        }
    }
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRange = 1...8
        let colRange = "A"..."H"
        if (rowRange.contains(coordinates.1) && colRange.contains(coordinates.0)) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
}

var game = GameDesk()
var queenBlack = Chessman(type: .queen, color: .black, figure: "\u{265B}", coordinates: ("A", 6))
game.setChessman(chess: queenBlack, coordinates: ("B", 2))
queenBlack.coordinates
game.setChessman(chess: queenBlack, coordinates: ("A", 3))
queenBlack.coordinates

type(of: game.desk)
game
game["A", 3]?.coordinates
game["C", 5] = queenBlack
game["C", 5]
game["C", 5] = nil
game["C", 5] // nil
