//
//  AppDelegate.swift
//  task3_app
//
//  Created by Erkam Karaca on 2.09.2023.
//

import Foundation
import UserNotifications
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        NotificationViewModel.shared.checkForPermission()
        return true
    }
}
