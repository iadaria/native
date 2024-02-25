//
//  ViewController.swift
//  Right on target
//
//  Created by Якимова Дарья on 25.02.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        // generate a random number
        self.number = Int.random(in: 1...50)
        // show the random number in Label
        self.label.text = String(self.number)
    }

    @IBAction func checkNumber() {
        let numSlider = Int(self.slider.value.rounded())
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
        if self.round == 5 {
            let alert = UIAlertController(
                title: "Game is over",
                message: "You earned \(self.points) points",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Begin again", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        // generate a random number
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
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

