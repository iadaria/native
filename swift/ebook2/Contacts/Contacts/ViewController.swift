//
//  ViewController.swift
//  Contacts
//
//  Created by Якимова Дарья on 28.02.24.
//

import UIKit

class ViewController: UIViewController {
    //var contacts = [ContactProtocol]()
    var storage: ContactStorageProtocol!
    var contacts: [ContactProtocol] = [] {
        didSet {
            contacts.sort { $0.title < $1.title }
            storage.save(contacts: contacts)
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = ContactStorage()
        loadContacts()
        // Do any additional setup after loading the view.
    }
    
    private func loadContacts() {
        contacts = storage.load()
        tableView.reloadData()
    }
    
    @IBAction func showNewCotactAlert() {
        let alertController = UIAlertController(title: "Create a new contact", message: "Enter the name and phone", preferredStyle: .alert)
        alertController.addTextField{ textField in textField.placeholder = "Name" }
        alertController.addTextField{ textField in textField.placeholder = "Number phone" }
        let createButton = UIAlertAction(title: "Create", style: .default) { _ in
            guard let contactName = alertController.textFields?[0].text,
                  let contactPhone = alertController.textFields?[1].text else {
                return
            }
            let contact = Contact(title: contactName, phone: contactPhone)
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelButton)
        alertController.addAction(createButton)
        
        // show Alert Controller
        self.present(alertController, animated: true, completion: nil)
    }
}

