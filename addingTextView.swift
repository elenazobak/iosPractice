        // Set up userInputField
               userInputField.translatesAutoresizingMaskIntoConstraints = false
               userInputField.borderStyle = .roundedRect
               userInputField.addTarget(self, action: #selector(userInputChanged), for: .editingChanged) // Add target for text changes
               view.addSubview(userInputField)
        
               // Add constraints to position the userInputField at the bottom of the view, just above the safe area
               let constraints = [
                   userInputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                   userInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                   userInputField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
               ]
               NSLayoutConstraint.activate(constraints)
  
        self.navigationController?.delegate = self    trying to fix navigation error