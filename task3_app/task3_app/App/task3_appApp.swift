//
//  task3_appApp.swift
//  task3_app
//
//  Created by Erkam Karaca on 1.09.2023.
//

import SwiftUI
import UserNotifications

@main
struct task3_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TimerView()
        }
    }
}


