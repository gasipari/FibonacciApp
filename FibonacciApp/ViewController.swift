//
//  ViewController.swift
//  FibonacciApp
//
//  Created by Marius on 5/4/15.
//  Copyright (c) 2015 Marius Mukunzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: 2, includesZero: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateFibonacciSequence()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var includesZeroSwitch: UISwitch!
    @IBOutlet weak var includesZeroLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var numberOfItemsSlider: UISlider!
    
    @IBAction func updateFibonacciSequence() {
        if includesZeroSwitch.on {
            numberOfItemsSlider.maximumValue = 94
        }else {
            numberOfItemsSlider.maximumValue = 93
        }
        fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: UInt64(numberOfItemsSlider.value), includesZero: includesZeroSwitch.on)
        textView.text = fibonacciSequence.values.description
        includesZeroLabel.text = includesZeroSwitch.on ? "Yes":"No"
        numberOfItemsLabel.text = String(Int(numberOfItemsSlider.value))
    }
}

