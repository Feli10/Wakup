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
    
    var curAlarm : Alarm? = nil
    
    @IBOutlet weak var reasonAnswer: UITextField?
    @IBOutlet weak var hint: UILabel!
    @IBOutlet weak var mathProblem: UILabel!
    @IBOutlet weak var mathAnswer: UITextField?
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
    
    
    @IBAction func submitAnswer(_ sender: Any) {
        if (reasonAnswer?.text)! == curAlarm?.reason && (mathAnswer?.text)! == "22"{
            self.stopButton.isHidden = false
        }
    }
    @IBAction func wantHint(_ sender: Any) {
        hint.text = "Reason: \(String(describing: curAlarm!.reason!))"
        hint.isHidden = false
    }
    @IBAction func changeProblem(_ sender: Any) {
        mathProblem.text = "2*4+7*1+0-4+11 ="
    }
    
    //print(alarmViewController.alarm.reason)
}
