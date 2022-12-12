//
//  ViewController.swift
//  tipcalc
//
//  Created by Kauther Zeini on 9/13/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var amountOfPeopleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true) //dismiss keyboard
    }
    
    func calculateEverything(){
        //Calculate the bill amount
        let bill = Double(billField.text!) ?? 0 //anything left of question mark, if not valid, make it 0
        
        //Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let amountOfPeople = Int(splitSlider.value)
        let perPersonTotal = total/Double(amountOfPeople)
        
        
        
        //Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip) //prints two decimal places for the tip
        totalLabel.text = String(format: "$%.2f", total) //prints two decimal places for the total
        amountOfPeopleLabel.text = "Total People: \(amountOfPeople)"
        
        perPersonLabel.text = String(format: "$%.2f", perPersonTotal)
        
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateEverything()
        
    }
    
    
    @IBAction func numberOfPeople(_ sender: Any) {
        calculateEverything()
        
        
    }
    
}

