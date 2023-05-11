//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Elena Zobak on 1/15/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    //@IBOutlet weak var bmiLabel: UILabel!
    
   // @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
        
    }
    

//    @IBAction func reCalculatePressed(_ sender: UIButton) {
//
//        self.dismiss(animated: true)
//    }
   

    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
        
    }
}
