//
//  ViewController.swift
//  sql_lesson
//
//  Created by dan on 26.03.2023.
//

import UIKit
  
class ViewController: UIViewController {
  
  
    @IBOutlet weak var tableView: UITableView!
      
    var db = DBManager()
    var emps = Array<Employee>()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
          
//        db.insert(id: 1, name: "John", age: 24)
//        db.insert(id: 2, name: "Mike", age: 25)
//        db.insert(id: 3, name: "Harsh", age: 23)
//        db.insert(id: 4, name: "Sachin", age: 44)
//        db.insert(id: 5, name: "Rohit", age: 32)
        emps = db.read()
          
        tableView.reloadData()
    }
    
    
    @IBAction func addPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let contactVC = storyboard.instantiateViewController(identifier: "ContactViewController") as? ContactViewController {
            contactVC.id = emps.count
            navigationController?.pushViewController(contactVC, animated: true)
        }
        self.tableView.reloadData()
    }
    
  
}
  
  
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "toContact", sender: self)
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        if let contactVC = storyboard.instantiateViewController(identifier: "ContactViewController") as? ContactViewController {
//            contactVC.title = movies[indexPath.row].originalTitle
//            contactVC.id = emps[indexPath.row].id
//            navigationController?.pushViewController(contactVC, animated: true)
//        }
//        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, sourceView, completionHandler) in
             print("index path of delete: \(indexPath)")
             completionHandler(true)
            self.db.deleteByID(id: indexPath.row)
            self.emps.remove(at: indexPath.row)
            self.tableView.reloadData()
         }

//         let rename = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
//             print("index path of edit: \(indexPath)")
//             self.performSegue(withIdentifier: "toContact", sender: self)
//             completionHandler(true)
//         }
         let swipeActionConfig = UISwipeActionsConfiguration(actions: [ delete])
         swipeActionConfig.performsFirstActionWithFullSwipe = false
        
         self.tableView.reloadData()
         return swipeActionConfig
    }
}
  
  
extension  ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emps.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") ?? UITableViewCell()
        cell.textLabel?.text = "Id: " + emps[indexPath.row].id.description + ", Name: " + emps[indexPath.row].name + ", age: " + emps[indexPath.row].age.description
        return cell
    }
}  
