//
//  ViewController.swift
//  BillCalculator
//
//  Created by Sachs, Ryan on 3/27/18.
//  Copyright © 2018 Sachs, Ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var billTotalTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTotalTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODO
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func tipValueChanged(_ sender: UISlider) {
        let tipPercent = round(sender.value)
        tipPercentLabel.text = "\(tipPercent)"
        if let billTotal = Float(billTotalTextField.text!) {
            let tipAmount = billTotal * tipPercent / 100
            tipAmountLabel.text = "\(roundToTwoPlaces(tipAmount))"
            let totalAmount = billTotal + tipAmount
            totalAmountLabel.text = "\(roundToTwoPlaces(totalAmount))"
        }
        
    }
    
    func roundToTwoPlaces(_ value: Float) -> Float {
        return round(value * 100) / 100
    }
    
}

