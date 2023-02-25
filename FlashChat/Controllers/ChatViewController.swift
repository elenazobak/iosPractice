//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey"),
        Message(sender: "a@b.com", body: "Hello"),
        Message(sender: "1@2.com", body: "Whats up")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       print (messages.count)
        tableView.delegate = self // we delete the delegate part
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
        
    }
    
    func loadMessages() {
      messages = []
        
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error { //if error is not nill
                print("There was a problem \(e)")
            } else {
                print("Im here")
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageSender)
                            self.messages.append(newMessage)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody
            ]) {(error) in
                if let e = error {
                    print("There was a problem saving to db\(e)")
                } else {
                    print("Successfully saved data")
                }
                
            }
        }
        
        
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
    let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        
        navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
    
    
    
}

//extension ChatViewController: UITableViewDelegate { We wan't no interaction with the messages so we delete the delegae extantion
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//}
