//
//  RemindersCloneApp.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/20/24.
//

import SwiftUI
import UserNotifications

@main
struct RemindersCloneApp: App {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
        
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListsScreen()
            }.modelContainer(for: MyList.self)
        }
    }
}
