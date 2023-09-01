//
//  task3_appApp.swift
//  task3_app
//
//  Created by Erkam Karaca on 1.09.2023.
//

import SwiftUI

@main
struct task3_appApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TimerView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
