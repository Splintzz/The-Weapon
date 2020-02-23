//
//  ViewController.swift
//  The Weapon II
//
//  Created by Spencer Carr on 2/9/19.
//  Copyright © 2019 Spencer Carr. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var countdownBar: NSLevelIndicator!
    @IBOutlet var testSlider: NSSlider!
    @IBOutlet var testLabel: NSTextField!
    @IBOutlet var testButton: NSButton!
    @IBOutlet var testTextField: NSTextField!
    @IBOutlet var checkBoxTest: NSButton!
    @IBOutlet var text: NSScrollView!
    
    @IBOutlet var textField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
        
       textField.stringValue
        
    }

    @IBAction func weaponLaunch(_ sender: NSButton) {
        countdownBar.integerValue += 1
        testSlider.isHidden = true
        checkBoxTest.state = NSControl.StateValue.on
        
    }
    
}


