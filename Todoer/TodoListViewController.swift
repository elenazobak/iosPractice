//
//  ViewController.swift
//  Todoer
//
//  Created by Elena Zobak on 2/27/23.
//

import UIKit
import RealmSwift


class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let realm = try! Realm()
    var selectedCategory : Category? {
        didSet{
            loadItems()
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        
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
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        //value = condition(value==value) ? valueIfTrue : valueIfFalse
        
        // if item.done is true, cell.accessoryType = .checkmark. If not, cell.accessoryType = .none
        cell.accessoryType = item.done ? .checkmark: .none
        
        return cell
    }
    
    //MARK: - TavleView Delegate Methods
    
    //When row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let selectedToDoItem = itemArray[indexPath.row]
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done      // each time row selected it changes the "done" value and reloads tableview
        
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //MARK: - Add New Items
    
    //Plus pressed
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        alert.addTextField { alertTextField in // Closure triggered only when textfield was added to the alert
            alertTextField.placeholder = "Create new item"
            textField = alertTextField //Prints empty optional because this action captured in the action complition block
            print(alertTextField.text ?? "bla")
        }
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
 
            self.saveItems()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    //MARK: - Model Manipulation Methods: Save data and load data so we can use CRUD
    
    func saveItems() {
        //Old saving data the Second way
        // let encoder = PropertyListEncoder()
        //        do {
        //            let data = try encoder.encode(itemArray)
        //            try data.write(to:dataFilePath!)
        //        } catch {
        //            print("Error encoding item array, \(error)")
        //        }
        
        //First way - when we were adding an Array of Strings to user defaults
        // self.defaults.set(self.itemArray, forKey: "TodoListArray")
        
        
        do {
            try context.save() // saves in the temporart area
        } catch {
            print ("Error saving context \(error)")
        }
        
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
            toDoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
            tableView.reloadData()
        }
    
}

//MARK: - Search bar methods

//extension TodoListViewController: UISearchBarDelegate {
//
//
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request : NSFetchRequest<Item> = Item.fetchRequest()
//
//        let predicate = NSPredicate(format: "title Contains[cd] %@", searchBar.text!)      // title should contain whatever is in the search bar
// // results should come back with the titles in ascending order
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//      loadItems(with: request, predicate: predicate)
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { // when we press on the x of the search bar
//        if searchBar.text!.count == 0 {
//            loadItems()
//
//
//            DispatchQueue.main.async {
//                 searchBar.resignFirstResponder()
//            }
//
//
//        }
//    }
//
//}

// for live search option
//func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {





