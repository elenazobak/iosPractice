//
//  ViewController.swift
//  Todoer
//
//  Created by Elena Zobak on 2/27/23.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard // Database

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        newItem.done = false
        itemArray.append(newItem)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
        
        
        // *** Nav bar attributes
        let appearance = UINavigationBarAppearance()
      appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemCyan
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
     navigationItem.standardAppearance = appearance
       navigationItem.scrollEdgeAppearance = appearance
    }

    //MARK: - Tableview Datasourse Methods


      // Number of rows
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
        }
        
    // How we display our cells
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
            
            let item = itemArray[indexPath.row] // so that we don't have to write it every time
            
           // var content = cell.defaultContentConfiguration()
           // content.text = itemArray[indexPath.row].title
            cell.textLabel?.text = item.title
            
            //Ternary operator ==>
            //value = condition(value==value) ? valueIfTrue : valueIfFalse
            
            
            cell.accessoryType = item.done ? .checkmark: .none // if item.done is true, cell.accessoryType = .checkmark. If not, cell.accessoryType = .none
            
            return cell
        }
    
    //MARK: - TavleView Delegate Methods
    
    //When row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let selectedToDoItem = itemArray[indexPath.row]
      
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done // each time row selected it changes the "done" value and reloads tableview
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
  
        
    }
    
    //MARK: - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            // "Add item pressed" - What happens when user clicks Add item on the alert
            
            let newItem = Item()
            newItem.title = textField.text! // giving the name from the text field
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in // Closure triggered only when textfield was added to the alert
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text ?? "bla") //Prints empty optional because this action captured in the action complition block
           
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    
    
    

}


    

