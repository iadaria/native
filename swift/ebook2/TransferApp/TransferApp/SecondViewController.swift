//
//  SecondViewController.swift
//  TransferApp
//
//  Created by Якимова Дарья on 29.02.24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var dataTextField: UITextField!
    
    var updatingData: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
}
