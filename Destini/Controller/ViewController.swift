//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let stories = [
        Story(s: "You see a fork in the road", c1: "Take a left", c2: "Take a right"),
        Story(s: "You see a tiger.", c1: "Shout for help", c2: "Play dead"),
        Story(s: "You find a treasure chest", c1: "Open it", c2: "Check for traps")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = stories[0].story

    }

    @IBAction func choiceMade(_ sender: UIButton) {
    
    
    
    }
    
    
}

