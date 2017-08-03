//
//  alarmDoneViewController.swift
//  Alarm
//
//  Created by chuangke-8 on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

// add hint <3
// uppercase and lowercase all okay
// remenber APIs!

/*
 later stuff:
 
 acounts
 leaderboards
 points
 similarity percentage
 statistics
 more sounds
 
 */

import UIKit

class alarmDoneViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var reasonAnswer: UITextField?
    @IBOutlet weak var hint: UILabel!
    @IBOutlet weak var mathProblem: UILabel!
    @IBOutlet weak var mathAnswer: UITextField?
    @IBOutlet weak var alarmDoneTime: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reasonAnswer?.delegate = self
        mathAnswer?.delegate = self
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        reasonAnswer?.resignFirstResponder()
        mathAnswer?.resignFirstResponder()
    }
}
