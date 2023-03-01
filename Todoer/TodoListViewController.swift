//
//  ViewController.swift
//  Todoer
//
//  Created by Elena Zobak on 2/27/23.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Find me","do something","sleep"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // *** Nav bar attributes
        let appearance = UINavigationBarAppearance()
      appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemCyan
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
     navigationItem.standardAppearance = appearance
       navigationItem.scrollEdgeAppearance = appearance
    }

    //MARK: - Tableview Methods


        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let todoItem = itemArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = itemArray[indexPath.row]
            cell.contentConfiguration = content
            
            return cell
        }
    
    //MARK: - TavleView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let selectedToDoItem = itemArray[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
  
        
    }
    
    //MARK: - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            //what happens when user clicks Add item on our alert
            print("Success!")
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text)
            print("Now")
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    
    
    

}


    

