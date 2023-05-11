//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
   
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numOfPeople = 0
    var result = 1.00
    var finalResult = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //dismiss keyboard
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        //Make the button that triggered the IBAction selected.
       sender.isSelected = true
                
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        //Get the stepper value using sender.value, round it down to a whole number then set it as the text in
             //the splitNumberLabel
             splitNumberLabel.text = String(format: "%.0f", sender.value)
             
             //Set the numberOfPeople property as the value of the stepper as a whole number.
             numOfPeople = Int(sender.value)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        print(tip) //double
        print(numOfPeople) //int
        let intAmount = Double(billTextField.text!)!//doubleAmount
        print(intAmount) //Double
        
        result = intAmount * (1 + tip) / Double(numOfPeople)
       finalResult = String(format: "%.2f", result)
        print(result)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    //This method gets triggered just before the segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResults" {
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalResult
            destinationVC.numOfPeople = numOfPeople
            destinationVC.tip = Int(tip * 100)
            
        }
    }
    
}

