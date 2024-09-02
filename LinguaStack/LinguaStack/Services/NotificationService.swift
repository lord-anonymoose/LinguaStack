//
//  NotificationService.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 02.09.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import Foundation
import UserNotifications

final class NotificationService {
    static func arrayToWeekdays(_ array: [Bool]) -> [Int] {
        var resultArray = [Int]()

        guard array.count == 7 else {
            return resultArray
        }
        
        
        for i in 0...array.count - 1 {
            if array[i] {
                resultArray.append(i+1)
            }
        }
        
        return resultArray
    }
    

    static func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    static func scheduleNotifications(_ array: [Bool], hour: Int, minute: Int) {

        let weekdaysArray = self.arrayToWeekdays(array)
        
        guard !weekdaysArray.isEmpty else {
            print("No days for adding a notification")
            return
        }
        
        let content = UNMutableNotificationContent()
        content.title = String(localized: "Hi there!")
        content.subtitle = String(localized: "Time to train your new vocabulary")
        content.sound = UNNotificationSound.default
        
        for i in weekdaysArray {

             var dateInfo = DateComponents()
             dateInfo.hour = hour
             dateInfo.minute = minute
             dateInfo.weekday = i
             dateInfo.timeZone = .current

             let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: true)
             let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error adding notification for weekday \(i): \(error.localizedDescription)")
                } else {
                    print("Notification scheduled for weekday \(i)")
                }
            }
        }
    }
}
