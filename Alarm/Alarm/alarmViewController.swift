//
//  alarmViewController.swift
//  Alarm
//
//  Created by chuangke-8 on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class alarmViewController: UIViewController, UITextFieldDelegate {
    
    var alarm: Alarm?
    var seconds = 10
    var timer = Timer()
    var counter = 0

    
    @IBOutlet weak var alarmTask: UITextField!
    @IBOutlet weak var timeOption: UISegmentedControl!
    @IBOutlet weak var timeOrHour: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var alarmReason: UITextField!
    @IBOutlet weak var mathProblem: UISwitch!
    @IBOutlet weak var fakeStopButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeOrHour.delegate = self
        alarmTask.delegate = self
        minutes.delegate = self
        alarmReason.delegate = self
        
        alarmTask.isEnabled = false
        timeOrHour.isEnabled = false
        minutes.isEnabled = false
        alarmReason.isEnabled = false
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        alarmTask.isEnabled = true
        timeOrHour.isEnabled = true
        minutes.isEnabled = true
        alarmReason.isEnabled = true
        editButton.isHidden = true
        doneButton.isEnabled = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        timeOrHour.resignFirstResponder()
        alarmTask.resignFirstResponder()
        minutes.resignFirstResponder()
        alarmReason.resignFirstResponder()
    }
    @IBAction func timeOptionChanged(_ sender: Any) {
        if minutesLabel.text == ":" {
            minutesLabel.text = "Minutes"
            timeLabel.text = "Hours"


        } else {
            minutesLabel.text = ":"
            timeLabel.text = "Time"


        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "done" {
            // if note exists, update title and content
            let alarm = self.alarm ?? CoreDataHelper.createAlarm()
            timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
            alarm.task = alarmTask.text ?? ""
            alarm.math = mathProblem.isOn
            alarm.option = Double(timeOption.selectedSegmentIndex)
            alarm.reason = alarmReason.text
            alarm.isHidden = true
            
            
            CoreDataHelper.saveAlarm()
        }
    }
    
    func update() {
        counter += 1
        if counter >= seconds {
            timer.invalidate()
            print("haha!")
            alarm?.isHidden = false
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 1
        if let alarm = alarm {
            // 2
            alarmTask.text = alarm.task
            timeOption.selectedSegmentIndex = Int(alarm.option)
            alarmReason.text = alarm.reason
            mathProblem.isOn = alarm.math
            timeOrHour.text = String(floor(Double(seconds / 60 / 60)))
            minutes.text = String(floor(Double(seconds / 60)))
            fakeStopButton.isHidden = alarm.isHidden
        } else {
            // 3
            alarmTask.text = ""
            timeOrHour.text = ""
        }
    }
    
    
}

