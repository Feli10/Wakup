//
//  alarmsTableViewController.swift
//  Alarm
//
//  Created by chuangke-8 on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class alarmsTableViewController: UITableViewController {
    var curAlarm : Alarm? = nil
    var alarms = [Alarm]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    // 2

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmTableViewCell", for: indexPath) as! AlarmTableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let alarm = alarms[row]
        
        // 3
        cell.alarmTitle.text = alarm.task
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let alarmViewController = segue.destination as! alarmViewController
        if let identifier = segue.identifier {
            if identifier == "displayAlarm" {
                print("Table view cell tapped")
                
                // 1
                let indexPath = tableView.indexPathForSelectedRow!
                // 2
                let alarm = alarms[indexPath.row]
                // 3
                
                // 4
                alarmViewController.alarm = alarm
                self.alarms = CoreDataHelper.retrieveAlarms()
            } else if identifier == "addAlarm" {
                print("+ button tapped")
            }
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            CoreDataHelper.deleteAlarm(alarm: alarms[indexPath.row])
            //2
            alarms = CoreDataHelper.retrieveAlarms()
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarms = CoreDataHelper.retrieveAlarms()
        
    }

    
}
