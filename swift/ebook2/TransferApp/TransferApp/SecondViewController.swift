//
//  SecondViewController.swift
//  TransferApp
//
//  Created by Якимова Дарья on 29.02.24.
//

import UIKit

protocol UpdatingDataController: AnyObject {
    var updatingData: String { get set }
}

class SecondViewController: UIViewController, UpdatingDataController {
    
    @IBOutlet var dataTextField: UITextField!
    var updatingData: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //initSceneA()
        updateTextFieldDataA(withText: updatingData)
    }
    
    private func updateTextFieldDataA(withText text: String) {
        dataTextField.text = text
    }
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        self.navigationController?.viewControllers.forEach {
            viewController in
            (viewController as? UpdatingDataController)?.updatingData = dataTextField.text ?? ""
        }
    }
}
