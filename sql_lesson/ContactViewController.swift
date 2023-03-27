//
//  ContactViewController.swift
//  sql_lesson
//
//  Created by dan on 27.03.2023.
//

import UIKit

class ContactViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    public var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
    }
    

    @IBAction func submitPressed(_ sender: Any) {
        let vc = ViewController()
        let nameData = nameField.text
        let ageData = Int(ageField.text!)
//        vc.db.updateByID(id: id, name: nameData!, age: ageData!)
        vc.db.insert(id: id, name: nameData!, age: ageData!)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mainVC = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController {
            navigationController?.pushViewController(mainVC, animated: true)
        }
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        self.performSegue(withIdentifier: "back", sender: self)
    }
}
