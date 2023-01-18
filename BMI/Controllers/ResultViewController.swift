//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Elena Zobak on 1/15/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
    }
    

    @IBAction func reCalculatePressed(_ sender: UIButton) {
    }
   

}
