//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Elena Zobak on 1/18/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit
//import SwiftUI


struct CalculatorBrain {
    var bmi: BMI?
    
    
    func getBMIValue() -> String {
        let bmiTo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0) //coralesing operator (optionals) chaining
        return bmiTo1Decimal
    }
    // color literal -> shows color picker
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue > 24.9 {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor {_ in return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)})
            print("stop!")
        } else if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pie!", color: UIColor {_ in return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)})
            print("eat more")
        } else {
            bmi = BMI(value: bmiValue, advice: "Normal", color: UIColor {_ in return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)})
            print("")
        }
    }
    
    func getAdvice() -> String {
       return bmi?.advice ?? "bla"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.black
    }
}

