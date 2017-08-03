//
//  manageAlarm.swift
//  Alarm
//
//  Created by chuangke-8 on 8/2/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CoreDataHelper {
    var alarm: Alarm?
    
    
    
    
    
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    static func createAlarm() -> Alarm {
        let alarm = NSEntityDescription.insertNewObject(forEntityName: "Alarm", into: managedContext) as! Alarm
        return alarm
    }
    static func saveAlarm() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    static func deleteAlarm(alarm: Alarm) {
        managedContext.delete(alarm)
        saveAlarm()
    }
    static func retrieveAlarms() -> [Alarm] {
        let fetchRequest = NSFetchRequest<Alarm>(entityName: "Alarm")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
}

