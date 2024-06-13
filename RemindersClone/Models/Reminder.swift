//
//  Reminder.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/22/24.
//

import Foundation
import SwiftData

@Model
class Reminder {
    
    var title: String = ""
    var notes: String?
    var isCompleted: Bool = false
    var reminderDate: Date?
    var reminderTime: Date?
    
    var list: MyList?
    
    init(title: String, notes: String? = nil, isCompleted: Bool = false, reminderDate: Date? = nil, remminderTime: Date? = nil, list: MyList? = nil) {
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
        self.reminderDate = reminderDate
        self.reminderTime = remminderTime
        self.list = list
    }
    
}
