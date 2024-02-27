//
//  ColorViewController.swift
//  Right on target
//
//  Created by Якимова Дарья on 26.02.24.
//

import UIKit

class ColorViewController: UIViewController {
    var game: Game<SecretColorValue>!
    // номер "правильной" кнопки
    var correctButtonTag: Int = 0
    
    // Текстовая метка для вывода HEX
    @IBOutlet var hexLabel: UILabel!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    
    // вспомогательное свойство, позволяющее работать с аутлетами кнопок, как с коллекцией
    var buttonsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = (GameFactory.getColorGame() as! Game<SecretColorValue>)
        buttonsCollection = [oneButton, twoButton, threeButton, fourButton]
        updateScene()
    }
    
    private func updateScene() {
        let secretColorString = game.secretValue.value.getByHEXString()
        updateSecretColorLabel(withText: secretColorString)
        updateButtons(withRightSecretValue: game.secretValue)
    }
    
    private func updateSecretColorLabel(withText newHEXColorText: String) {
        hexLabel.text = "#\(newHEXColorText)"
    }
    
    // Проверка выбранного пользователем цвета
    @IBAction func compareValue(sender: UIButton) {
        var userValue = game.secretValue
        userValue.value = Color(from: sender.backgroundColor!)
        game.calculateScore(secretValue: game.secretValue, userValue: userValue)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateScene()
    }
    
    // Обновление фонового цвета кнопок
    private func updateButtons(withRightSecretValue secretValue: SecretColorValue) {
        // определяем, какая кнопка будет правильной
        correctButtonTag = Array(1...4).randomElement()!
        buttonsCollection.forEach{ button in
            if button.tag == correctButtonTag {
                button.backgroundColor = secretValue.value.getByUIColor()
            } else {
                var copySelectValueForButton = secretValue
                copySelectValueForButton.setRandomValue()
                button.backgroundColor = copySelectValueForButton.value.getByUIColor()
            }
        }
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Game is over",
            message: "You earned \(score) points",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Begin again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
