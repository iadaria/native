//
//  ViewController.swift
//  Right on target
//
//  Created by Якимова Дарья on 25.02.24.
//

import UIKit

class ViewController: UIViewController {
    var game: Game<SecretNumbericValue>!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        game = (GameFactory.getNumericGame() as! Game<SecretNumbericValue>)
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    // Проверка выбранного пользователем числа
    @IBAction func checkNumber() {
        var userSecretValue = game.secretValue
        userSecretValue.value = Int(slider.value)
        game.calculateScore(secretValue: game.secretValue, userValue: userSecretValue)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Game is over",
            message: "You earned \(score) points",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Begin again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappera")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
}

