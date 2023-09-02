//
//  NotificationViewModel.swift
//  task3_app
//
//  Created by Erkam Karaca on 2.09.2023.
//

import Foundation
import UserNotifications

class NotificationViewModel: ObservableObject {
    static let shared = NotificationViewModel()
    static var permissionGranted = false
    
    private init() {}
    
    func checkForPermission() {
        // Checking to ensure that user not change permission.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                NotificationViewModel.permissionGranted = true
                return
            case .denied:
                NotificationViewModel.permissionGranted = false
                return
            case .notDetermined:
                self.requestUserPermission()
            default:
                return
            }
        }
    }
    
    func requestUserPermission() {
        // Request permission for notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                NotificationViewModel.permissionGranted = true
                print("Notification permission granted")
            } else {
                NotificationViewModel.permissionGranted = false
                print("Notification permission denied")
            }
        }
    }
    
    func scheduleNotification(title: String, body: String, remainingTime: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound(named: UNNotificationSoundName("song.mp3"))
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: remainingTime, repeats: false) // Customize the trigger as needed
        
        let request = UNNotificationRequest(identifier: "backgroundNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled to \(Int(remainingTime)) seconds successfully")
            }
        }
    }
    
    
}
