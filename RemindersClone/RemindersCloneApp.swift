//
//  RemindersCloneApp.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/20/24.
//

import SwiftUI

@main
struct RemindersCloneApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListsScreen()
            }.modelContainer(for: MyList.self)
        }
    }
}
