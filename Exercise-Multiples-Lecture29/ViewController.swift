//
//  ViewController.swift
//  Exercise-Multiples-Lecture29
//
//  Created by Felix Barros on 11/30/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var multiplesTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    var currentMultiple: Int {
        get {
            if let enteredText = multiplesTextField.text, enteredMultiple = Int(enteredText) {
                return enteredMultiple
            } else {
                return 0
            }
        }
    }
    var currentTotal: Int = 0
    var previousMultiple: Int = 0
    var previousTotal: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playTapped(sender: AnyObject) {
        updateTotals()
        updateResultLabel()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    // MARK: Helper functions
    func updateResultLabel() {
        resultLabel.text = "\(previousTotal) + \(currentMultiple) = \(currentTotal)"
    }
    
    func updateTotals() {
        // If currentMultiple and previousMultiple do not match, reset the chain
        if (currentMultiple != previousMultiple) {
            // Reset variables and start a new chain
            currentTotal = 0
            previousMultiple = currentMultiple
            previousTotal = 0
        }
        
        // Test that value will not overflow
        if currentMultiple <= currentTotal.distanceTo(Int.max) {
            // At this point, currentTotal contains the value from last time
            previousTotal = currentTotal
            currentTotal = previousTotal + currentMultiple
        }
    }

}

