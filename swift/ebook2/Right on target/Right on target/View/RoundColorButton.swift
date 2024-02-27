import UIKit

class FoundColorButton: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = layer.frame.height
    }
}
