import PlaygroundSupport
import UIKit


let sizeOfArea = CGSize(width: 400, height: 400)
var area = SquareArea(size: sizeOfArea, color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
PlaygroundPage.current.liveView = area

/* Balls */

protocol BallProtocol {
    init(color: UIColor, radius: Int, coordinates: (x: Int, y: Int))
}

public class Ball: UIView, BallProtocol {
    required init(color: UIColor, radius: Int, coordinates: (x: Int, y: Int)) {
        super.init(frame: CGRect(x: coordinates.x, y: coordinates.y, width: radius * 2, height: radius * 2))
        self.layer.cornerRadius = self.bounds.width / 2.0
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/* SquareArea */

protocol SquareAreaProtocol {
    init(size: CGSize, color: UIColor)
    func setBalls(withColors: [UIColor], andRadius: Int)
}

public class SquareArea: UIView, SquareAreaProtocol {
    private var balls: [Ball] = []
    private var animator: UIDynamicAnimator?
    private var snapBehavior: UISnapBehavior?
    private var collisionBehavior: UICollisionBehavior
    
    required init(size: CGSize, color: UIColor) {
        collisionBehavior = UICollisionBehavior(items: [])
        super.init(frame: CGRect(x:0, y:0, width: size.width, height: size.height))
        self.backgroundColor = color
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(
        with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        // подключаем аниматор с указанием на сам класс
        animator = UIDynamicAnimator(referenceView: self)
        // подключаем к аниматору обработчик столкновений
        animator?.addBehavior(collisionBehavior)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBalls(withColors: [UIColor], andRadius: Int) {
    
    }
}
