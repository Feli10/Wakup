//
//  alarmViewController.swift
//  Alarm
//
//  Created by chuangke-8 on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import  UserNotifications
import NotificationCenter
import UserNotificationsUI

class alarmViewController: UIViewController, UITextFieldDelegate {
    
    var alarm: Alarm?
        var timer = Timer()


    
    @IBOutlet weak var alarmTask: UITextField!
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let alarm2 = self.alarm ?? CoreDataHelper.createAlarm()

        if segue.identifier == "done" {
            // if note exists, update title and content
            timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
            alarm2.task = alarmTask.text ?? ""
            alarm2.math = mathProblem.isOn
            alarm2.reason = alarmReason.text
            alarm2.isHidden = true
            alarm2.seconds =  (Double(timeOrHour.text!)! * 60 + Double(minutes.text!)!) * 60
            alarm2.date = Date.init(timeIntervalSinceNow: alarm2.seconds) as NSDate
            
            CoreDataHelper.saveAlarm()
            
            
        }
        if segue.identifier == "toAlarmDone" {
            let vc = (segue.destination as! alarmDoneViewController)
            vc.curAlarm = alarm2
            alarm?.isHidden = true
        }
    }
    
    func update() {
        if Date.init() > alarm?.date as! Date {
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
            alarmReason.text = alarm.reason
            mathProblem.isOn = alarm.math
            timeOrHour.text = String(floor(Double(alarm.seconds / 60 / 60)))
            minutes.text = String(floor(Double(alarm.seconds / 60)))
            fakeStopButton.isHidden = alarm.isHidden
        } else {
            // 3
            alarmTask.text = ""
            timeOrHour.text = ""
        }
    }
    
    
}

