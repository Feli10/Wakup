//
//  alarmsTableViewController.swift
//  Alarm
//
//  Created by chuangke-8 on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class alarmsTableViewController: UITableViewController {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmTableViewCell", for: indexPath) as! alarmTableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let alarm = alarms[row]
        
        // 3
        cell.alarmTitle.text = alarm.title
        
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
