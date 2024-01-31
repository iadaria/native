//
//  ViewController.swift
//  Quiz1
//
//  Created by Якимова Дарья on 29.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    let newView = UIView()
    let textField = UITextField()
    let textFieldBounds = UITextField()
    let frame = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        view.addSubview(newView)
        print(frame)
        
        //newView.frame = self.frame
        
        
        //let point = CGPoint(x: 100, y: 200)
        let size = CGSize(width: 100, height: 100)
        let point = CGPoint(x: frame.width/2-(size.width/2), y: frame.height/2-(size.height/2))
        
        //newView.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        newView.frame = CGRect(origin: point, size: size)
        
        newView.backgroundColor = .white
        
        //newView.center = view.center
        
        newView.addSubview(textField)
        textField.frame = CGRect(x: 5, y: 5, width: 290, height: 50)
        textField.text = "x: \(newView.frame.minX) y: \(newView.frame.minY) w: \(newView.frame.width) h: \(newView.frame.height)"
        
        newView.addSubview(textFieldBounds)
        textFieldBounds.frame = CGRect(x:5, y: 60, width: 290, height: 50)
        textFieldBounds.text = "x: \(newView.bounds.minX) y: \(newView.bounds.minY) w: \(newView.bounds.width) h: \(newView.bounds.height)"
        
        textField.backgroundColor = .gray
        textFieldBounds.backgroundColor = .darkGray
        
    }


}

